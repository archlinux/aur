# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-system-info
pkgver=6.7.4
pkgrel=1
pkgdesc='A utility that provides information about a computer system'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-system-info'
license=(LGPL-2.0-or-later)
depends=(aha
         clinfo
         dmidecode
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
         libstdc++
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
sha256sums=('a77f207ac3ad2fffc5409917066181c6798c436789eddff69d667170e5f3546b')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
