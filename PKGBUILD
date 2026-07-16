# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-workspace-addons
pkgver=6.7.3
pkgrel=1
pkgdesc='All kind of addons to improve your SonicDE experience'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-workspace-addons'
license=(LGPL-2.0-or-later)
depends=(glibc
         icu
         kcmutils
         kconfig
         kdbusaddons
         kdeclarative
         kholidays
         ki18n
         kiconthemes
         kirigami-addons
         kitemmodels
         kjobwidgets
         knewstuff
         knotifications
         kpackage
         kservice
         ksvg
         kunitconversion
         kwidgetsaddons
         kxmlgui
         libgcc
         libstdc++
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-quick3d
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-runner
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-win
         sonic-workspace
         sonnet
         systemd-libs)
makedepends=(networkmanager-qt
             qt6-webengine
             sonic-frameworks-cmake-modules)
optdepends=('networkmanager-qt: POTD wallpaper'
            'qt6-webengine: dictionary and webbrowser applets'
            'quota-tools: disk quota applet')
provides=(kdeplasma-addons)
conflicts=(kdeplasma-addons)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('89035e42c4973e3e0b0084a198469133d19778450872dc5e476d77838b75f41b')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
