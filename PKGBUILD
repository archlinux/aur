# Maintainer:
# Contributor: Daniel Landau <aur@landau.fi>

_pkgname="qcsxcad"
pkgname="$_pkgname"
pkgver=0.6.3
pkgrel=1
pkgdesc="Qt-GUI for CSXCAD"
arch=("x86_64")
url="https://github.com/thliebig/QCSXCAD"
license=("LGPL-3.0-or-later")

depends=(
  'qt5-base'
  'tinyxml'
  'vtk'

  ## AUR
  'csxcad'
)
makedepends=(
  'cmake'
  'fast_float'
  'fmt'
  'glew'
  'ninja'
  'nlohmann-json'
  'openmpi'
  'verdict'
)

_pkgsrc="QCSXCAD-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('f05edbcca65f0bf8a3fb6ab20baa3db0b8651c2baab2f6a3f0113436c866f879')

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
