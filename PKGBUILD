pkgname=rapidcsv
pkgver=8.92
pkgrel=2
pkgdesc="C++ CSV parser library"
arch=('any')
url="https://github.com/d99kris/rapidcsv"
license=('BSD')
makedepends=('cmake')
source=($pkgver-$pkgname.tar.gz::https://github.com/d99kris/rapidcsv/archive/refs/tags/v${pkgver}.tar.gz
        fix-install-dirs.patch)
sha256sums=('054f96336fc524dd5e99e3e0a5efc700c4db4692e88da33ed3e8929abcdcf9e6'
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
