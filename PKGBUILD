# Maintainer: Miroslav Koskar (http://mkoskar.com/)

# Based on canon-pixma-mx870-complete-3.30-1:
# Maintainer: Jeremy Sands <cto@jeremysands.com>

_series='mx920series'
_cnijfilterver='3.90'
_scangearmpver='2.10'

pkgname='canon-pixma-mx920-complete'
pkgver="$_cnijfilterver.$_scangearmpver"
pkgrel=2
pkgdesc='Complete driver set (printing and scanning) for Canon Pixma MX920 series'
url='http://www.canon.co.uk/Support/Consumer_Products/product_ranges/printers/pixma/index.aspx'
license=('custom')
arch=('i686' 'x86_64')
depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff')

if [ "$CARCH" = 'i686' ]; then
    _CARCH='i386'
elif [ "$CARCH" = 'x86_64' ]; then
    _CARCH='amd64'
fi

source=('http://gdlp01.c-wss.com/gds/0/0100005170/01/cnijfilter-mx920series-3.90-1-deb.tar.gz'
        'http://gdlp01.c-wss.com/gds/3/0100005183/01/scangearmp-mx920series-2.10-1-deb.tar.gz')
md5sums=('76e30668391521abf749c21d8a46f5fe'
         '4ea7c1909831b24f0c737d5e4b7c0034')

package() {
    cd "$srcdir"/cnijfilter-"$_series-$_cnijfilterver"-1-deb/packages
    ar x cnijfilter-common_"$_cnijfilterver"-1_"$_CARCH".deb
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1
    ar x cnijfilter-"${_series}_$_cnijfilterver"-1_"$_CARCH".deb
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1

    cd "$srcdir"/scangearmp-"$_series-$_scangearmpver"-1-deb/packages
    ar x scangearmp-common_"$_scangearmpver"-1_"$_CARCH".deb
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1
    ar x scangearmp-"${_series}_$_scangearmpver"-1_"$_CARCH".deb
    tar xf data.tar.gz -C "$pkgdir" --strip-components=1
}
