# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-login-manager
pkgver=6.7.2.1
pkgrel=1
arch=(x86_64)
pkgdesc='Sonic Login Manager'
url='https://github.com/Sonic-DE/sonic-login-manager'
license=(GPL-2.0-or-later)
depends=(glibc
         kcmutils
         kconfig
         kdbusaddons
         ki18n
         kpackage
         kservice
         libstdc++
         libxau
         pam
         qt6-5compat
         qt6-base
         qt6-declarative
         sh
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-screen-library
         sonic-workspace
         systemd-libs
         xorg-server)
makedepends=(qt6-tools
             sonic-frameworks-cmake-modules)
provides=(plasma-login-manager)
conflicts=(plasma-login-manager)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e3a1ebfdddbafec976ad621edda787216512e9b7c6310a64c7a0d44a7b2b6aa0')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
