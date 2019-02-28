pkgname=icglue
pkgver=2.2
pkgrel=1
pkgdesc="a Tcl-Library for scripted HDL generation"
arch=('i686' 'x86_64')
url="https://icglue.org"
license=('GPL')
depends=('glib2' 'tcl' 'pkg-config')
makedepends=('make' 'gcc')
optdepends=('nagelfar: for vim syntastics functionality')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/icglue/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('71133d6c7b1a027700465f2a4e4dbf17')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    echo $LDFLAGS
    LDFLAGS=${LDFLAGS}${LDFLAGS:+,}--no-as-needed make

    if which nagelfar >> /dev/null 2>&1 ; then
        make syntaxdb
    fi
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir/" install
}

