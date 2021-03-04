#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

echo '100' > /proc/sys/vm/swappiness
swapoff /dev/block/zram0 > /dev/null 2>&1
echo '1' > /sys/block/zram0/reset
echo '0' > /sys/block/zram0/disksize
echo '8' > /sys/block/zram0/max_comp_streams
echo '2139095040' > /sys/block/zram0/disksize
mkswap /dev/block/zram0 > /dev/null 2>&1
swapon /dev/block/zram0 > /dev/null 2>&1

if [ -e /data/zram.log ]; then
rm /data/zram.log
fi

echo "Yaya Laressa Redmi 3S zRAM Pie" > /data/zram.log
echo "excecuted on $(date +"%d-%m-%Y %r" )" >> /data/zram.log

