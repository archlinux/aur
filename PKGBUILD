# Maintainer: abelian424

_pkgname="disman"
pkgname="$_pkgname-kwinft"
pkgver=0.600.0
pkgrel=3
pkgdesc='Qt/C++ display management library'
url="https://github.com/winft/disman"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  qt6-base

  # AUR
  wrapland
)
makedepends=(
  extra-cmake-modules
  git
  kcoreaddons
  microsoft-gsl
  ninja
)

provides=("disman=$pkgver")
conflicts=("disman")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('bf584ab99b585f4d88a6e0310b71d5aab500361ae8369acab0d2a0cd1abe784c')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
