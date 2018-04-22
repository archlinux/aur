# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname='barvinok'
pkgver=0.40
pkgrel=2
pkgdesc='A library for counting the number of integer points in parametric and non-parametric polytopes'
arch=('x86_64')
url='http://freecode.com/projects/barvinok'
license=('GPL')
depends=('ntl' 'isl' 'polylib-gmp')
source=("http://barvinok.gforge.inria.fr/$pkgname-$pkgver.tar.xz")
md5sums=('a5c0b48b4e336ee652e6e517d14ea9b6')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # NTL 11 now uses pthread functions, so we need to have it link to libpthread.
    ./configure --prefix=/usr --enable-shared-barvinok --with-isl=system --with-polylib=system LIBS="-lpthread"
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
