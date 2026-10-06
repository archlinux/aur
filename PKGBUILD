# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-bluetooth-runtime
pkgver=6.7.5
pkgrel=1
pkgdesc='Integrate Bluetooth within SonicDE without Wayland components'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-bluetooth-runtime'
license=(GPL-2.0-or-later)
depends=(bluez-qt
         glibc
         kcmutils
         kconfig
         kdbusaddons
         kdeclarative
         ki18n
         kjobwidgets
         knotifications
         kservice
         ksvg
         kwidgetsaddons
         libstdc++
         qt6-base
         qt6-declarative
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries)
makedepends=(shared-mime-info
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
optdepends=('bluez-obex: file transfer'
            'pulseaudio-bluetooth: to connect to A2DP profile')
provides=(bluedevil)
conflicts=(bluedevil)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8ea0c52a0ee8f6879ea51430e44e92f5eac0d1b1ba679fe6266933125fc6247f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
