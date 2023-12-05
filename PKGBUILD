# Maintainer: Miroslav Koškár <https://mkoskar.com/>

# Based on canon-pixma-mx870-complete-3.30-1 by:
#   Maintainer: Jeremy Sands <cto@jeremysands.com>

_series='mx920series'
_cnijfilterver=3.90
_scangearmpver=2.10

pkgname='canon-pixma-mx920-complete'
pkgver="$_cnijfilterver.$_scangearmpver"
pkgrel=3
pkgdesc='Complete driver set (printing and scanning) for Canon Pixma MX920 series'
url='http://www.canon.co.uk/Support/Consumer_Products/product_ranges/printers/pixma/index.aspx'
license=(custom)
arch=(x86_64)
depends=(ghostscript gtk2 libcups libpng12 libtiff libusb-compat popt)

case $CARCH in
    i686) _CARCH='i386' ;;
    x86_64) _CARCH='amd64' ;;
esac

source=(
    http://gdlp01.c-wss.com/gds/0/0100005170/01/cnijfilter-mx920series-3.90-1-deb.tar.gz
    http://gdlp01.c-wss.com/gds/3/0100005183/01/scangearmp-mx920series-2.10-1-deb.tar.gz
)
sha256sums=(
    822412389866de3a2478c88338272163ab686e787a30e7127582401aaaa25ca1
    44f7e0ae35093c3c79021ce35faa8d23e013ef7cdc183e395e877965ff6957c0
)

package() {
    cd "$srcdir/cnijfilter-$_series-$_cnijfilterver-1-deb/packages"
    ar x "cnijfilter-common_$_cnijfilterver-1_$_CARCH.deb"
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1
    ar x "cnijfilter-${_series}_$_cnijfilterver-1_$_CARCH.deb"
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1

    cd "$srcdir/scangearmp-$_series-$_scangearmpver-1-deb/packages"
    ar x "scangearmp-common_$_scangearmpver-1_$_CARCH.deb"
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1
    ar x "scangearmp-${_series}_$_scangearmpver-1_$_CARCH.deb"
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1
}
