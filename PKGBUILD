# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=dell-h825cdw-s2825cdn
pkgver=1.0_3
pkgrel=9
pkgdesc="Proprietary driver for Dell's H825cdw and S2825 Printers"
arch=('x86_64')
url="https://www.dell.com/support/home/en-us/product-support/product/dell-h825cdw-printer/drivers"
license=('LicenseRef-Dell-Technologies-End-User-License-Agreement')
depends=('libcups' 'glibc')
DLAGENTS=("http::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("http://dl.dell.com/FOLDER03385341M/1/Printer_H825cdw_Driver_Dell_A00_Linux.zip")
makedepends=('unzip' 'libarchive')
sha256sums=('e993d3ebbcbfa7dfa7f74d00096bab57bafbdb4b9415f5b69169cd7485a1b18c')

#_rpmfile="S2825cdn-H825cdw/Dell-Color-MFP-S2825cdn-H825cdw-${pkgver//_/-}.$CARCH.rpm"
_rpmfile="Dell-Color-MFP-S2825cdn-H825cdw-${pkgver//_/-}.$CARCH.rpm"


prepare() {
    cd "$srcdir/"

    unzip -n Printer_H825cdw_Driver_Dell_A00_Linux.zip

    cd "$srcdir/S2825cdn-H825cdw"
    bsdtar -f $_rpmfile -x
}

package() {
    mv "$srcdir/S2825cdn-H825cdw/usr" "$srcdir/usr"
    mv "$srcdir/S2825cdn-H825cdw/License" "$srcdir/License"
    mkdir -p "$pkgdir"/usr/share/cups/model && mkdir -p "$pkgdir"/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw
    install -Dm644 "$srcdir"/usr/share/cups/model/Dell/Dell_Color_MFP_S2825cdn.ppd.gz "$pkgdir"/usr/share/cups/model/Dell/Dell_Color_MFP_S2825cdn.ppd.gz
    install -Dm644 "$srcdir"/usr/share/cups/model/Dell/Dell_Color_MFP_H825cdw.ppd.gz "$pkgdir"/usr/share/cups/model/Dell/Dell_Color_MFP_H825cdw.ppd.gz
    install -Dm755 "$srcdir"/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw/DellSecureFilter "$pkgdir"/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw/DellSecureFilter
    install -Dm644 "$srcdir"/License/English/License.txt "$pkgdir"/usr/share/licenses/"$pkgname"/License.txt
}

