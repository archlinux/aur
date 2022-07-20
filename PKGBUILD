# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
pkgname=barvinok
pkgver=0.41.6
pkgrel=1
pkgdesc='A library for counting the number of integer points in (non-)parametric polytopes'
arch=('x86_64')
url='https://barvinok.sourceforge.io/'
license=('GPL')
depends=('ntl' 'libisl>0.19' 'polylib-gmp')
source=("https://barvinok.sourceforge.io/$pkgname-$pkgver.tar.xz")
sha256sums=('1e647f847af44fced0eb554b82452f2ff7a9ab2bcb618eee3a49e44eb4f8b2dd')

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
