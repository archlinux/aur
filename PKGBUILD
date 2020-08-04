pkgname=icglue
pkgver=4.1
pkgrel=1
pkgdesc="a Tcl-Library for scripted HDL generation"
arch=('i686' 'x86_64')
url="https://icglue.org"
license=('GPL')
depends=('glib2' 'tcl' 'pkg-config')
makedepends=('make' 'gcc' 'inkscape')
optdepends=('nagelfar: for vim syntastics functionality')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/icglue/${pkgname}/archive/v${pkgver}.tar.gz
        genlogo.patch)
sha256sums=('5ef49d43551b0fc4ce020a57859186e04e89cca8af021d0d8c079649eb217271'
            'cdbc6c959d148bd66c7f2c36cf9251b549978b4c008ca78492f4d211cc18c055')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir/genlogo.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make

    if which nagelfar >> /dev/null 2>&1 ; then
        make syntaxdb
    fi
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir/" install
}

