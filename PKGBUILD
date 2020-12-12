# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=dell-h825cdw-s2825cdn
pkgver=1.0_3
pkgrel=1
pkgdesc="Proprietary driver for Dell's H825cdw and S2825 Printers"
arch=('x86_64')
url="https://www.dell.com/support/home/en-us/product-support/product/dell-h825cdw-printer/drivers"
license=('Dell Software License Agreement')
makedepends=('unzip')
depends=('cups')
source=('https://dl.dell.com/FOLDER03385341M/1/Printer_H825cdw_Driver_Dell_A00_Linux.zip')
sha256sums=('e993d3ebbcbfa7dfa7f74d00096bab57bafbdb4b9415f5b69169cd7485a1b18c')
noextract=("${source[@]##*/}")

_rpmfile="S2825cdn-H825cdw/Dell-Color-MFP-S2825cdn-H825cdw-${pkgver//_/-}.$CARCH.rpm"


prepare() {
    cd "$srcdir/"
    unzip "${source[@]##*/}" "$_rpmfile"
    bsdtar -f $_rpmfile -x
}

package() {
    mkdir -p $pkgdir/usr/share/cups/model && mkdir -p $pkgdir/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw
    install -D -m 644 $srcdir/usr/share/cups/model/Dell/Dell_Color_MFP_S2825cdn.ppd.gz $pkgdir/usr/share/cups/model/Dell/Dell_Color_MFP_S2825cdn.ppd.gz
    install -D -m 644 $srcdir/usr/share/cups/model/Dell/Dell_Color_MFP_H825cdw.ppd.gz $pkgdir/usr/share/cups/model/Dell/Dell_Color_MFP_H825cdw.ppd.gz
    install -D -m 755 $srcdir/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw/DellSecureFilter $pkgdir/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw/DellSecureFilter
}

