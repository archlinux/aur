# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-network-manager
pkgver=6.7.2
pkgrel=1
pkgdesc='SonicDE applet written in QML for managing network connections'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-network-manager'
license=(GPL-2.0-or-later)
depends=(glib2
         glibc
         kcmutils
         kcolorscheme
         kcompletion
         kconfig
         kdbusaddons
         kdeclarative
         ki18n
         kirigami-addons
         kjobwidgets
         knotifications
         kquickcharts
         kservice
         ksvg
         kwidgetsaddons
         libnm
         libstdc++
         modemmanager-qt
         networkmanager-qt
         openssl
         prison
         qcoro
         qt6-base
         qt6-declarative
         qtkeychain-qt6
         solid
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-workspace)
makedepends=(openconnect
             qt6-webengine
             sonic-frameworks-cmake-modules)
optdepends=('openconnect: Cisco AnyConnect VPN plugin'
            'qrca: QR code scanner'
            'qt6-webengine: Cisco AnyConnect VPN plugin')
provides=(plasma-nm)
conflicts=(plasma-nm)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2e87b45ec4e2b3323ad33042a267f726ee98ca1d7ef6f8a9da745dd2c16f39bd')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
