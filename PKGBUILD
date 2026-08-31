# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-login-manager
pkgver=6.7.4.5
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
sha256sums=('c38d7b67889b5f733dbf59fa6746bcfef6a40105f5059c3ce8bf4114400ef953')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
