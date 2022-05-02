# Maintainer: Tony Lambiris <tony@libpcap.net>
# Based on canon-pixma-mx920-complete by: Miroslav Koškár <http://mkoskar.com/>

_cnijfilterver=5.50
_scangearmpver=3.50

pkgname=canon-pixma-lt7500-complete
pkgver="$_cnijfilterver.$_scangearmpver"
pkgrel=3
pkgdesc='Complete driver set (printing and scanning) for Canon Pixma TR7500 series'
url='http://www.canon.co.uk/Support/Consumer_Products/product_ranges/printers/pixma/index.aspx'
license=(custom)
arch=(i686 x86_64)
depends=(libcups popt libpng12 libusb-compat libtiff)
source=(
	http://gdlp01.c-wss.com/gds/8/0100009108/01/cnijfilter2-${_cnijfilterver}-1-deb.tar.gz
	http://gdlp01.c-wss.com/gds/1/0100009111/01/scangearmp2-${_scangearmpver}-1-deb.tar.gz
)
sha256sums=('d90c16e3050e9676db51d3db4b1157416d2cc950b2f2e8b9f0d4c178a94cbbd0'
            '4a500f4c62fa30f4ded100aa07c95f3ee24ec1afbf2269222fc7801399b19b0a')

case $CARCH in
    i686) _CARCH='i386' ;;
    x86_64) _CARCH='amd64' ;;
esac

package() {
    cd "$srcdir/cnijfilter2-${_cnijfilterver}-1-deb/packages"
    ar x "cnijfilter2_${_cnijfilterver}-1_$_CARCH.deb"
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1

    cd "$srcdir/scangearmp2-${_scangearmpver}-1-deb/packages"
    ar x "scangearmp2_${_scangearmpver}-1_$_CARCH.deb"
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1
}
