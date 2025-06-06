# Maintainer:
# Contributor: archlinux.info:tdy

_pkgname="cutechess"
pkgname="$_pkgname"
pkgver=1.4.0
pkgrel=1
pkgdesc="Tools for working with chess engines"
url="https://github.com/cutechess/cutechess"
license=('GPL-3.0-or-later')
arch=(i686 x86_64)

depends=(
  'hicolor-icon-theme'
  'qt6-5compat'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'doxygen'
  'ninja'
)

provides=("cutechess-cli=${pkgver%%.r*}")
conflicts=("cutechess-cli")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('7adf8e8d867c13acf5273b568a39bf9d0d722d3de0141cea953e624f8839b506')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DWITH_TESTS=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
