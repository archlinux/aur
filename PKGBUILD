pkgname=icglue
pkgver=4.0
pkgrel=1
pkgdesc="a Tcl-Library for scripted HDL generation"
arch=('i686' 'x86_64')
url="https://icglue.org"
license=('GPL')
depends=('glib2' 'tcl' 'pkg-config')
makedepends=('make' 'gcc' 'inkscape')
optdepends=('nagelfar: for vim syntastics functionality')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/icglue/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('69e0593bfae0206b542ae08160fe5b2746e60caabbe9dd003ecd98cd5da79138')

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

