# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-keybind-daemon
pkgver=6.7.3
pkgrel=1
pkgdesc='Daemon providing Global Keyboard Shortcut (Accelerator) functionality'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-keybind-daemon'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kcrash
         kdbusaddons
         kjobwidgets
         kservice
         libx11
         libxcb
         qt6-base
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-windowsystem
         xcb-util-keysyms)
makedepends=(sonic-frameworks-cmake-modules)
provides=(kglobalacceld)
conflicts=(kglobalacceld)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('10735cff2b6f7143a294888ac79bfa44a135811b320a198cc67eec90a8149632')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
