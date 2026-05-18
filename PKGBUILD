pkgname=rapidcsv
pkgver=8.97
pkgrel=1
pkgdesc="C++ CSV parser library"
arch=('any')
url="https://github.com/d99kris/rapidcsv"
license=('BSD')
makedepends=('cmake')
source=($pkgver-$pkgname.tar.gz::https://github.com/d99kris/rapidcsv/archive/refs/tags/v${pkgver}.tar.gz
        fix-install-dirs.patch)
sha256sums=('933e2f1a9c4308fc320458845cc5dfff679a5f5bf6d3c6f42725c85910d75d04'
            'dbe9a63fbecc4f8653b6e79b80ac298ff8cc6619614923a1346720e22ef5f101')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir/fix-install-dirs.patch"
}

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
