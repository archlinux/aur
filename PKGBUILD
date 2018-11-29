# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=libcint
pkgver=3.0.14
pkgrel=1
pkgdesc="General GTO integrals for quantum chemistry"
arch=(i686 x86_64)
url="http://wiki.sunqm.net/libcint"
license=('BSD')
depends=('blas')
makedepends=('cmake')
provides=($pkgname=$pkgver)
conflicts=(libcint-cint3)
source=("https://github.com/sunqm/libcint/archive/v$pkgver.tar.gz")
sha256sums=('2952d59203f011680c2039ddb1d7337cd669b12632386496ce2ba2afdafbfcad')

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake -DWITH_F12=ON -DWITH_RANGE_COULOMB=1 -DWITH_COULOMB_ERF=1 \
          -DCMAKE_INSTALL_LIBDIR:PATH="lib" \
          -DCMAKE_INSTALL_PREFIX:PATH="/usr" ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
