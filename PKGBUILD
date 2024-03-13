# Maintainer: abelian424

_pkgname="como"
pkgname="$_pkgname"
pkgver=0.1.0
pkgrel=2
pkgdesc='Library collection to easily create Wayland and X11 compositors'
url="https://github.com/winft/como"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  kauth
  kconfigwidgets
  kdecoration
  kquickcharts
  libepoxy
  libqaccessibilityclient-qt6
  qt6-5compat
  qt6-declarative
  qt6-tools
  wlroots

  # AUR
  wrapland

  ## implicit
  #hicolor-icon-theme
  #kcmutils
  #kcolorscheme
  #kconfig
  #kcoreaddons
  #kglobalaccel
  #ki18n
  #kidletime
  #kirigami
  #kpackage
  #kservice
  #ksvg
  #kwidgetsaddons
  #kwindowsystem
  #libinput
  #libplasma
  #libx11
  #libxcb
  #libxkbcommon
  #qt6-base
  #wayland
  #xcb-util-image
  #xcb-util-keysyms
)
makedepends=(
  extra-cmake-modules
  git
  kdoctools
  ninja
)

provides=("kwin")
conflicts=("kwin")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext"
)
sha256sums=(
  '49d9b8b8b8197f4443f8eae71db8adecf51da73c221a4712d0d8cc46b9fdc09f'
)

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DCMAKE_INSTALL_LIBEXECDIR="lib/$_pkgname"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
