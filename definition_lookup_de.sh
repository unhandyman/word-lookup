word=$(xclip -o)
res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/de/$word")
regex=$'"definition":"\K(.*?)(?=")'
definitions=$(echo $res | grep -Po "$regex")
separatedDefinition=$(sed ':a;N;$!ba;s/\n/\n\n/g' <<< "$definitions")

dunstify -u low -t 10000 "$word" "$separatedDefinition"
