# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=libdjinterop
pkgver="0.27.1"
pkgrel=1
pkgdesc="C++ library that allows accessing database formats used in DJ software."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xsco/libdjinterop"
license=('LGPL-3.0-only')
groups=('pro-audio')
makedepends=(
  'sqlite3'
  'zlib'
  'boost'
)
provides=('libdjinterop')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xsco/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4c7393ab70b7c92374557e72c86f650bea73ba50e59f6e5a683c69038cc7ea48')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D OPTIMIZE=native
    -S "${pkgname}-${pkgver}"
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
