# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=dell-h825cdw-s2825cdn
pkgver=1.0_3
pkgrel=6
pkgdesc="Proprietary driver for Dell's H825cdw and S2825 Printers"
arch=('x86_64')
url="https://www.dell.com/support/home/en-us/product-support/product/dell-h825cdw-printer/drivers"
license=('custom')
depends=('cups')
makedepends=('unzip' 'wget')

#_rpmfile="S2825cdn-H825cdw/Dell-Color-MFP-S2825cdn-H825cdw-${pkgver//_/-}.$CARCH.rpm"
_rpmfile="Dell-Color-MFP-S2825cdn-H825cdw-${pkgver//_/-}.$CARCH.rpm"


prepare() {
    cd "$srcdir/"

    wget https://dl.dell.com/FOLDER03385341M/1/Printer_H825cdw_Driver_Dell_A00_Linux.zip
    unzip Printer_H825cdw_Driver_Dell_A00_Linux.zip

    cd "$srcdir/S2825cdn-H825cdw"
    bsdtar -f $_rpmfile -x
}

package() {
    mv "$srcdir/S2825cdn-H825cdw/usr" "$srcdir/usr"
    mv "$srcdir/S2825cdn-H825cdw/License" "$srcdir/License"
    mkdir -p "$pkgdir"/usr/share/cups/model && mkdir -p "$pkgdir"/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw
    install -D -m 644 "$srcdir"/usr/share/cups/model/Dell/Dell_Color_MFP_S2825cdn.ppd.gz "$pkgdir"/usr/share/cups/model/Dell/Dell_Color_MFP_S2825cdn.ppd.gz
    install -D -m 644 "$srcdir"/usr/share/cups/model/Dell/Dell_Color_MFP_H825cdw.ppd.gz "$pkgdir"/usr/share/cups/model/Dell/Dell_Color_MFP_H825cdw.ppd.gz
    install -D -m 755 "$srcdir"/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw/DellSecureFilter "$pkgdir"/usr/lib/cups/filter/Dell-Color-MFP-S2825cdn-H825cdw/DellSecureFilter
    install -D -m 644 "$srcdir"/License/English/License.txt "$pkgdir"/usr/share/licenses/"$pkgname"/License.txt
}

