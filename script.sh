for i in 1 2 3 4 5 6 7 8 9 ; do
wget http://witestlab.poly.edu/bikes/20160$i-citibike-tripdata.zip
unzip 20160$i-citibike-tripdata.zip
mv 20160$i-citibike-tripdata.csv data0$i.csv
awk -F "\"*,\"*" '{print $5}' data0$i.csv > station0$i.txt
awk -F "\"*,\"*" '{print $9}' data0$i.csv >> station0$i.txt
sort station0$i.txt > sorted0$i.txt
echo "Sorting Done"
uniq -c sorted0$i.txt > uniq0$i.txt
echo "counting done"
sort -nr uniq0$i.txt >> all.txt
rm sorted0$i.txt
rm uniq0$i.txt
done



