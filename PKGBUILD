# Maintainer:
# Contributor: Silas Henrique <silash35@gmail.com>

_pkgname="qpdftools"
pkgname="$_pkgname"
pkgver=3.1.2
pkgrel=1
pkgdesc="An easy-to-use Qt interface for Ghostscript and QPDF"
url="https://github.com/silash35/qpdftools"
license=('Unlicense')
arch=('x86_64')

depends=(
  'ghostscript'
  'hicolor-icon-theme'
  'qpdf'
  'qt6-base'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
  'qt6-tools'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('a728ad4fc0e9919f157a8d67d36cd109b7a14e2f9087bbaf7cd32ade5aaea589')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
