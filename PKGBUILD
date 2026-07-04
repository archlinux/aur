# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-system-info
pkgver=6.7.2
pkgrel=1
pkgdesc='A utility that provides information about a computer system'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-system-info'
license=(LGPL-2.0-or-later)
depends=(aha
         clinfo
         dmidecode
         gcc-libs
         glibc
         glu
         iproute2 # ip
         kcmutils
         kconfig
         kdeclarative
         ki18n
         kservice
         libdisplay-info
         libdrm
         libpulse # pactl
         libusb
         lm_sensors
         mesa-utils
         qt6-base
         qt6-declarative
         sh
         solid
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-frameworks-quick-ui
         systemd-libs
         systemsettings
         vulkan-tools
         wayland-utils
         xorg-xdpyinfo)
makedepends=(fwupd
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools
             vulkan-headers)
optdepends=('fwupd: firmware security module'
            'plasma-disks: SMART devices health monitor')
provides=(kinfocenter)
conflicts=(kinfocenter)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a35bf4ab84780006bd110caf1c295ac29c2672d5f5694a9685bc1998f54b66af')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
