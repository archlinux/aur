pkgname=coin-or-qpoases
pkgver=3.2.1
pkgrel=2
pkgdesc="COIN-OR QP solver with online active set strategy"
arch=(i686 x86_64)
url="https://github.com/coin-or/qpOASES"
license=(LGPL2.1)
groups=(coin-or)
makedepends=(cmake)
depends=(blas lapack)
_name=qpOASES
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/releases/$pkgver.tar.gz")
sha256sums=('a7d153b4e23ee66bd50cdb6e84291d0084d9967a9c788a4d873440a6b10ca13b')

prepare() {
  sed -i "s/STATIC/SHARED/" "qpOASES-releases-$pkgver/CMakeLists.txt"
}

build() {
  cmake -B "build-$pkgver" -S "qpOASES-releases-$pkgver" \
      -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "build-$pkgver"
}

check() {
  "./build-$pkgver/bin/example1"
}

package() {
  DESTDIR="$pkgdir" cmake --build "build-$pkgver" -t install
}
