# Maintainer: Thomas Schneider <c.monty@web.de>

pkgname=dell-c2660dn
pkgver=1.0_1
pkgrel=1
pkgdesc="Dell C2660dn Color Laser Printer Cups Driver"
arch=('any')
url="https://www.dell.com/support/home/de/de/debsdt1/product-support/product/dell-c2660dn/drivers"
license=('Dell Software License Agreement')
makedepends=('unzip')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=('https://downloads.dell.com/FOLDER01820929M/1/C2660dn-Linux-Driver.zip')
md5sums=('da9da0888152c1dab531b60747a6a3c3')
noextract=("${source[@]##*/}")

rpmfile="Dell-C2660-Color-Laser-${pkgver//_/-}.i686.rpm"

prepare() {
    cd "$srcdir/"
    unzip "${source[@]##*/}" "$rpmfile"
    bsdtar -f $rpmfile -x
}

package() {
    mkdir -p $pkgdir/usr/share/cups/model && mkdir -p $pkgdir/usr/lib/cups/filter/Dell-C2660-Color-Laser
    install -D -m 644 $srcdir/usr/share/cups/model/Dell/Dell_C2660dn_Color_Laser.ppd.gz $pkgdir/usr/share/cups/model
    install -D -m 755 $srcdir/usr/lib/cups/filter/Dell-C2660-Color-Laser/DLPSACJFilter $pkgdir/usr/lib/cups/filter/Dell-C2660-Color-Laser
}
