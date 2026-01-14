# Maintainer: artist for XLibre <artist4xlibre@proton.me>

pkgname=sonic-win
_pkgname=kwin-x11
pkgver=6.5.5
_pkgver=$pkgver
_pkgtag=$pkgver
pkgrel=1
pkgdesc='kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for XLibre'
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
         kglobalaccel
         kglobalacceld
         kguiaddons
         ki18n
         kirigami
         kitemmodels
         knewstuff
         knotifications
         kpackage
         kquickcharts
         kscreenlocker
         kservice
         ksvg
         kwidgetsaddons
         kwindowsystem
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
         libplasma=$_pkgver
         mesa
         plasma-x11-session
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         qt6-wayland
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
groups=(sonic-de)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+${url}.git#tag=${_pkgtag}")
install="$pkgname.install"
options=(!debug)
sha256sums=('a77fb21faf11240af95160365f67f20538add7b77599da6d025150b4841898c8')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

