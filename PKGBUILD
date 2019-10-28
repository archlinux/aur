# Maintainer: Roman Fuerst <roman.fuerst@becompany.ch>

pkgname=dell-h625cdw
pkgver=1.0_3
pkgrel=1
pkgdesc="Proprietary driver for Dell H625cdw Color Laser Printer"
arch=('x86_64')
url="https://www.dell.com/support/home/us/en/04/product-support/product/dell-h625cdw-printer/drivers"
license=('Dell Software License Agreement')
makedepends=('unzip')
depends=('cups')
source=('https://downloads.dell.com/FOLDER03385155M/1/Printer_H625cdw_Driver_Dell_A00_Linux.zip')
sha256sums=('42b3e2ece02fed14b7795a047fa27f0bb6a2fc32f33e71ab71cb5a8b22ee4545')
noextract=("${source[@]##*/}")

rpmfile="H625cdw/Dell-Color-MFP-H625cdw-${pkgver//_/-}.x86_64.rpm"


prepare() {
    cd "$srcdir/"
    unzip "${source[@]##*/}" "$rpmfile"
    bsdtar -f $rpmfile -x
}

package() {
    mkdir -p $pkgdir/usr/share/cups/model && mkdir -p $pkgdir/usr/lib/cups/filter/Dell-Color-MFP-H625cdw
    install -D -m 644 $srcdir/usr/share/cups/model/Dell/Dell_Color_MFP_H625cdw.ppd.gz $pkgdir/usr/share/cups/model/Dell/Dell_Color_MFP_H625cdw.ppd.gz
    install -D -m 755 $srcdir/usr/lib/cups/filter/Dell-Color-MFP-H625cdw/DellSecureFilter $pkgdir/usr/lib/cups/filter/Dell-Color-MFP-H625cdw/DellSecureFilter
}

