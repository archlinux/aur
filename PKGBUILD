# Maintainer: artist for XLibre <artist4xlibre@proton.me>

pkgname=sonic-win
pkgver=6.6.5.1
_pkgtag=$pkgver
pkgrel=1
pkgdesc='An easy to use, but flexible, X Window Manager for SonicDE'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-win'
license=(LGPL-2.0-or-later)
depends=(aurorae
         breeze
         gcc-libs
         glibc
         plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdeclarative
         kdecoration
         kguiaddons
         ki18n
         kirigami
         kitemmodels
         knewstuff
         knotifications
         kpackage
         kquickcharts
         kservice
         ksvg
         kwidgetsaddons
         kxmlgui
         lcms2
         libcanberra
         libdisplay-info
         libdrm
         libepoxy
         libqaccessibilityclient-qt6
         libx11
         libxcb
         libxi
         libxkbcommon
         libxkbcommon-x11
         mesa
         plasma-x11-session
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         qt6-wayland
         sonic-frameworks-keybind
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-keybind-daemon
         sonic-screenlocker
         systemd-libs
         wayland
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             git
             kdoctools
             plasma-wayland-protocols
             python
             wayland-protocols)
groups=(sonicde)
conflicts=(kwin-x11)
provides=(kwin-x11)
#source=("git+${url}.git#tag=${_pkgtag}")
source=("${url}/archive/refs/tags/${_pkgtag}.tar.gz")
install="$pkgname.install"
options=(!debug)
sha256sums=('ef1e7da51724cafb3fdd133451651163e2208d9dcc1d42e5c1e706d5ac27fd3c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
