# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=libcint
pkgver=3.0.18
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
sha256sums=('c5ecc295f912fd9b80f41c353286172e710ed52ce825d1255d25a0388b6c8ffe')

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
