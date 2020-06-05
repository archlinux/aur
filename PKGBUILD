# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=libcint
pkgver=3.0.20
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
sha256sums=('91fa8e5015c0c191c922ebadbba96472d0613b407aae50e8b8e9c394dd8c6567')

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
