# Maintainer: Duy Truong <jimreynold2nd@yahoo.com>

pkgname=ppd-dell-e525w
pkgver=1.0_28
pkgrel=2
pkgdesc="Dell Color Multifunction Printer E525w Linux PPD Driver"
arch=('any')
url="http://www.dell.com/support/home/il/he/ildhs1/Drivers/DriversDetails?driverId=074W2"
license=('Dell Software License Agreement')
makedepends=('unzip')
depends=('cups')
source=('https://downloads.dell.com/FOLDER03001259M/1/Printer_E525w_Driver_Dell_A00_Linux.zip')
sha256sums=('de9c04666e3d7a71e230d928b8e4314cc09dffc1f1cba5b8524bffb339d40015')
noextract=("${source[@]##*/}")

rpmfile="Dell-Color-MFP-E525w-${pkgver//_/-}.noarch.rpm"

prepare() {
    cd "$srcdir/"
    unzip "${source[@]##*/}" "$rpmfile"
    bsdtar -f $rpmfile -x
}

package() {
    mkdir -p $pkgdir/usr/share/cups/model
    install -m 0755 $srcdir/usr/share/cups/model/Dell/Dell_Color_MFP_E525w.ppd.gz $pkgdir/usr/share/cups/model
}
