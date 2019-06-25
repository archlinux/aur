pkgname=icglue
pkgver=3.2
pkgrel=1
pkgdesc="a Tcl-Library for scripted HDL generation"
arch=('i686' 'x86_64')
url="https://icglue.org"
license=('GPL')
depends=('glib2' 'tcl' 'pkg-config')
makedepends=('make' 'gcc' 'inkscape')
optdepends=('nagelfar: for vim syntastics functionality')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/icglue/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('b279a901bfa5ca62e9d620bf9e4b7ed7')

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

