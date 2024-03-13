# Maintainer:

_pkgname="kwinft"
pkgname="$_pkgname"
pkgver=6.0.0
pkgrel=3
pkgdesc='Wayland and X11 Compositor for the KDE Plasma desktop (theseus-ship)'
url="https://github.com/winft/theseus-ship"
license=("LGPL-2.1-only")
arch=('x86_64' 'aarch64')

depends=(
  kcrash
  kdbusaddons
  kdecoration
  knewstuff
  kscreenlocker
  libepoxy
  pixman
  qt6-multimedia
  qt6-tools
  wlroots

  # AUR
  como

  ## implicit
  #kcmutils
  #kcolorscheme
  #kconfig
  #kcoreaddons
  #kglobalaccel
  #ki18n
  #kirigami
  #knotifications
  #kpackage
  #ksvg
  #kwidgetsaddons
  #kwindowsystem
  #kxmlgui
  #libx11
  #libxcb
  #libxi
  #libxkbcommon
  #libxkbcommon-x11
  #qt6-base
  #qt6-declarative
  #wayland
  #xcb-util-cursor
  #xcb-util-keysyms
  #xcb-util-wm
)
makedepends=(
  breeze
  extra-cmake-modules
  git
  kdeclarative
  microsoft-gsl
  ninja
)
optdepends=(
  'qt6-virtualkeyboard: virtual keyboard support for kwin-wayland'
)

provides=("theseus-ship=$pkgver")
conflicts=("theseus-ship")

install="$_pkgname.install"

_pkgsrc="theseus-ship-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('ffd8cf6c0b48cda918a74df372c55f42e00c9151420b4148b5e9f67ae05a05d5')

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
