# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-keybind-daemon
pkgver=6.7.4
pkgrel=1
pkgdesc='Daemon providing Global Keyboard Shortcut (Accelerator) functionality'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-keybind-daemon'
license=(LGPL-2.0-or-later)
depends=(glibc
         kconfig
         kcrash
         kdbusaddons
         kjobwidgets
         kservice
         libstdc++
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
sha256sums=('6011564ff7685002af1996d908c5e93c11c121651dbaa3bae1c7f783d47b96c8')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
