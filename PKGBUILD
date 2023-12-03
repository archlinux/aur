# Maintainer:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname="telepathy-qt"
pkgname="$_pkgname"
pkgver=0.9.8
pkgrel=3
arch=('x86_64' 'aarch64')
url="https://github.com/TelepathyQt/telepathy-qt"
# url="https://telepathy.freedesktop.org/wiki/"
license=(LGPL)
pkgdesc="A library for Qt-based Telepathy clients"

depends=(
  qt5-base
  telepathy-farstream
)
makedepends=(
  cmake
  doxygen
  python
  qt5-tools
)
source=(
  "https://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
)
sha256sums=(
  'bf8e2a09060addb80475a4938105b9b41d9e6837999b7a00e5351783857e18ad'
  'SKIP'
)
validpgpkeys=('AA33B0D27868E36C151780F0FE0B6D736B1195ED') # Alexandr Akulich

build() {
  local _cmake_options=(
    -B build
    -S "$pkgname-$pkgver"

    -DCMAKE_INSTALL_PREFIX=/usr
    -DENABLE_EXAMPLES=OFF
    -DENABLE_TESTS=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
