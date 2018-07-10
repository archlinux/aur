# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=libcint-cint3
pkgver=3.0.0
pkgrel=1
pkgdesc="General GTO integrals for quantum chemistry (cint3 branch)"
arch=(i686 x86_64)
url="http://wiki.sunqm.net/libcint"
license=('BSD')
depends=('blas')
makedepends=('cmake')
provides=($pkgname=$pkgver)
conflicts=(libcint)
source=(${pkgname}::git+https://github.com/sunqm/libcint.git#branch=cint3)
md5sums=('SKIP')

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake -DWITH_F12=ON -DWITH_RANGE_COULOMB=1 -DWITH_COULOMB_ERF=1 \
          -DCMAKE_INSTALL_LIBDIR:PATH="lib" \
          -DCMAKE_INSTALL_PREFIX:PATH="/usr" ..
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
