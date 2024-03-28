# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: davedatum <ask at davedatum dot com>

_pkgname="heimer"
pkgname="$_pkgname"
pkgver=4.4.0
pkgrel=1
pkgdesc="Cross-platform mind map, diagram, and note-taking tool"
url='https://github.com/juzzlin/heimer'
license=('GPL-3.0-or-later')
arch=("x86_64")

depends=(
  'hicolor-icon-theme'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'qt6-tools'
)

_pkgsrc="Heimer-$pkgver"
_pkgext="tar.gz"
source=("$pkgname-$pkgver.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('47fb77842b1f870bc545a7229a0d1a7f81fc69f99943adee66cb6e96a1c34940')

build() {
  local _cmake_options=(
    -S "$_pkgsrc"
    -B build
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_WITH_QT6=YES
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
