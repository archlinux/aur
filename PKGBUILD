# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Yarema aka Knedlyk <yupadmin at gmail dot com>
pkgname=vdr-channelscan
pkgver=1.2.0
_vdrapi=2.6.3
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Channel scanner for VDR"
url='https://bitbucket.org/ua0lnj/channelscan'
license=("GPL2")
depends=('bzip2' "vdr-api=${_vdrapi}" 'zlib')
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.bz2::https://bitbucket.org/ua0lnj/channelscan/get/$pkgver.tar.bz2"
        "$pkgname-fix_Makefile.patch")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/channelscan/"{0019,0030,0049,0070,0090,0100,0130,0160,0192,0200,0215,0235,0255,0260,0282,0305,0308,0315,0330,0360,0380,0390,0400,0420,0425,0450,0460,0475,0480,0490,0500,0505,0515,0520,0525,0530,0549,0550,0560,0570,0585,0600,0620,0642,0650,0660,0685,0705,0721,0740,0750,0765,0785,0801,0830,0850,0865,0875,0880,0900,0915,0922,0935,0950,0965,0980,1005,1030,1055,1082,1100,1105,1130,1155,1160,1180,1195,1200,1220,1222,1240,1250,1280,1285,1320,1340,1380,1400,1420,1440,1500,1520,1540,1560,1590,1600,1620,1640,1660,1690,1720,1800,1830,2210,2250,2270,2290,2310,2330,2350,2370,2390,2410,2430,2432,2451,2470,2489,2500,2527,2550,2570,2590,2608,2630,2650,2669,2690,2710,2728,2729,2730,2750,2760,2770,2780,2790,2812,2820,2830,2850,2873,2881,2882,2900,2930,2950,2970,2985,2990,3020,3045,3070,3100,3125,3150,3169,3195,3225,3240,3255,3285,3300,3325,3355,3380,3400,3420,3450,3460,3475,3490,3520,3530,3550,3560,3570,3592,Iptv,Sat}".ini"
        "var/lib/vdr/plugins/channelscan/"{S100.5E,S10.0E,S101.0W,S103.0W,S105.0E,S105.0W,S105.5E,S107.3W,S107.7E,S108.0E,S1.0W,S110.0E,S110.0W,S110.5E,S11.0W,S111.1W,S113.0E,S113.0W,S116.0E,S116.8W,S118.0E,S119.0W,S120.0E,S121.0W,S122.2E,S123.0W,S124.0E,S125.0W,S12.5W,S127.0W,S128.0E,S129.0W,S13.0E,S131.0W,S132.0E,S133.0W,S134.0E,S135.0W,S136.0E,S137.0W,S138.0E,S139.0W,S144.0E,S145.0E,S146.0E,S148.0E,S148.0W,S150.0E,S15.0W,S152.0E,S154.0E,S156.0E,S158.0E,S160.0E,S16.0E,S162.0E,S164.0E,S166.0E,S169.0E,S177.0W,S180.0E,S18.0W,S19.2E,S20.0W,S21.0E,S21.6E,S22.0W,S23.5E,S24.5W,S26.0E,S27.5W,S28.2E,S30.0W,S30.5E,S3.0E,S31.3E,S31.5W,S33.0E,S34.5W,S36.0E,S37.5W,S38.0E,S39.0E,S40.0E,S40.5W,S4.0W,S42.0E,S42.5E,S43.0W,S45.0E,S45.0W,S49.0E,S50.0W,S5.0E,S5.0W,S53.0E,S53.0W,S55.0E,S55.5W,S56.0E,S57.0E,S58.0W,S60.0E,S61.0W,S61.5W,S62.0E,S63.0W,S64.0E,S65.0W,S66.0E,S68.5E,S70.0W,S70.5E,S7.0E,S7.0W,S72.0E,S72.0W,S72.5W,S74.0E,S74.0W,S75.0E,S76.5E,S78.5E,S79.0W,S80.0E,S8.0W,S82.0W,S83.0E,S83.0W,S84.0W,S85.2E,S87.0W,S87.5E,S88.0E,S90.0E,S91.0W,S91.5E,S92.0W,S93.0W,S93.5E,S95.0E,S95.0W,S96.5E,S97.0W,S99.0W,Sat}".tpl"
        "var/lib/vdr/plugins/channelscan/Sat.url"
       )
sha256sums=('58bf3c760ef47541bbb3986d82eeb3207b3393392e636b8636db9895a8de2e99'
            '91a01e9e93c778f7545f9622c06b10bd2bb04585d7d9e34995cb3a4a9d520896')

# Use this as template for getting the backup file list. Here for ".tpl" files.
# $ tar -vtf repo/vdr-channelscan-1.1.4-3-x86_64.pkg.tar.xz | grep 'var/lib' | sed -rn 's/\.tpl$//p' | cut -d '/' -f 7 | sort | tr '\n' ','

prepare() {
  cd "${srcdir}/$(tar -tf "$srcdir/$pkgname-$pkgver.tar.bz2" | head -1)"

  patch -p1 -i "$srcdir/$pkgname-fix_Makefile.patch"
}

build() {
  cd "${srcdir}/$(tar -tf "$srcdir/$pkgname-$pkgver.tar.bz2" | head -1)"
  make
}

package() {
  cd "${srcdir}/$(tar -tf "$srcdir/$pkgname-$pkgver.tar.bz2" | head -1)"
  make DESTDIR="${pkgdir}" install

  mkdir -p ${pkgdir}/var/lib/vdr/plugins/${_plugname}
  cp -r ./transponders/. ${pkgdir}/var/lib/vdr/plugins/${_plugname}/
  chown -R 666:666 "$pkgdir/var/lib/vdr"

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
