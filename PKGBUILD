pkgname=icglue
pkgver=3.4
pkgrel=1
pkgdesc="a Tcl-Library for scripted HDL generation"
arch=('i686' 'x86_64')
url="https://icglue.org"
license=('GPL')
depends=('glib2' 'tcl' 'pkg-config')
makedepends=('make' 'gcc' 'inkscape')
optdepends=('nagelfar: for vim syntastics functionality')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/icglue/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('9b6085bfd979a7328060f9b386135fc8e6e3c4d0ab75d9dc1380dcfb65fb6f33')

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

