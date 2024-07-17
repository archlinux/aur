# Maintainer:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

## links
# https://telepathy.freedesktop.org/wiki/
# https://github.com/TelepathyQt/telepathy-qt

_pkgname="telepathy-qt"
pkgname="$_pkgname"
pkgver=0.9.8
pkgrel=4
pkgdesc="A library for Qt-based Telepathy clients"
url="https://github.com/TelepathyQt/telepathy-qt"
license=('LGPL-2.1-or-later')
arch=('x86_64' 'aarch64')

depends=(
  qt5-base
  telepathy-farstream
)
makedepends=(
  cmake
  doxygen
  ninja
  python
  qt5-tools
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "https://telepathy.freedesktop.org/releases/$_pkgname/$_pkgsrc.$_pkgext"{,.asc}
)
sha256sums=(
  'bf8e2a09060addb80475a4938105b9b41d9e6837999b7a00e5351783857e18ad'
  'SKIP'
)
validpgpkeys=('AA33B0D27868E36C151780F0FE0B6D736B1195ED') # Alexandr Akulich

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
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
