#!/bin/bash
for line in `cat hostname_username_password.csv`
do
  hostname=`echo $line | cut -d";" -f1`
  username=`echo $line | cut -d";" -f2`
  password=`echo $line | cut -d";" -f3`
  ./expect.us ssh $hostname $username $password "yum -y install ntp"
  ./expect.us scp $hostname $username $password source/ntp.conf /etc/ntp.conf
done