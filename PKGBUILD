# Maintainer: abelian424

_pkgname="kdisplay"
pkgname="$_pkgname-kwinft"
pkgver=6.0.0
pkgrel=2
pkgdesc='Display management app and daemon'
url="https://github.com/winft/kdisplay"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  kdeclarative
  layer-shell-qt
  libplasma
  plasma5support
  qt6-sensors

  # AUR
  disman

  ## implicit
  #kcmutils
  #kconfig
  #kcoreaddons
  #kdbusaddons
  #kglobalaccel
  #ki18n
  #kirigami
  #ksvg
  #kwindowsystem
  #kxmlgui
  #qt6-declarative
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
sha256sums=('b1da715f9eb0cffb116ea9d0f756668da96848db562b4a2de5a524f321759537')

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
