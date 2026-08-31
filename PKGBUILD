# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=xdg-desktop-portal-sonicde
pkgver=6.7.4.1
pkgrel=1
pkgdesc='X11 backend for xdg-desktop-portal using SonicDE and Qt'
arch=(x86_64)
url='https://github.com/Sonic-DE/xdg-desktop-portal-sonicde'
license=(LGPL-2.0-or-later)
depends=(glibc
         kconfig
         kcrash
         ki18n
         sonic-frameworks-io-fuse
         kservice
         kstatusnotifieritem
         knotifications
         kwidgetsaddons
         libei
         libpipewire
         libstdc++
         libxcb
         libxkbcommon
         libxkbcommon-x11
         qt6-base
         qt6-declarative
         sonic-frameworks-core-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-pipewire
         sonic-workspace
         xcb-util
         xcb-util-image
         xcb-util-renderutil
         xcb-util-wm
         xdg-desktop-portal)
makedepends=(sonic-frameworks-cmake-modules)
provides=(xdg-desktop-portal-impl xdg-desktop-portal-kde)
conflicts=(xdg-desktop-portal-kde)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a8b63008b233044bac0ba0ef9369c60e12f5c454908ce1ae62adb748db48bc4e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
