# Maintainer:

_pkgname="kdisplay"
pkgname="$_pkgname"
pkgver=6.2.0
pkgrel=1
pkgdesc='Display management app and daemon (kwinft)'
url="https://github.com/winft/kdisplay"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  disman # AUR
  kdeclarative
  layer-shell-qt
  libplasma
  plasma5support
  qt6-sensors
)
makedepends=(
  extra-cmake-modules
  git
  ninja
)

provides=("kscreen=$pkgver")
conflicts=("kscreen")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('27831dab267a565200be3045acd1276dac5191149c9e67e2e8d8295a7baa43ca')

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
