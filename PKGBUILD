# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-network-manager
pkgver=6.7.4
pkgrel=1
pkgdesc='SonicDE applet written in QML for managing network connections'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-network-manager'
license=(GPL-2.0-or-later)
depends=(glib2
         glibc
         kcmutils
         kcompletion
         kconfig
         kdbusaddons
         kdeclarative
         ki18n
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
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-frameworks-quick-ui
         sonic-frameworks-quick-ui-addons
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
sha256sums=('d75be79e6cdf35951bf07658bdd7cf5702b859eb6fa155b7ca593212da2c2e9c')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
