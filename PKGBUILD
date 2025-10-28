# Maintainer: fortime <palfortime@gmail.com>

pkgname=plasma-nm-qtkeychain
pkgver=6.5.0_1
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections. This fork replaces kwallet with qtkeychain. All secrets should be enrolled again.'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glib2
         glibc
         kcmutils
         kcolorscheme
         kcompletion
         kconfig
         kcoreaddons
         kdbusaddons
         kdeclarative
         ki18n
         kio
         kirigami
         knotifications
         kquickcharts
         ksvg
         kwallet
         kwidgetsaddons
         kwindowsystem
         libnm
         libplasma
         modemmanager-qt
         networkmanager-qt
         plasma-workspace
         prison
         qca-qt6
         qcoro-qt6
         qt6-base
         qt6-declarative
         solid
         qtkeychain-qt6)
makedepends=(extra-cmake-modules
             openconnect
             qt6-webengine
)
optdepends=('openconnect: Cisco AnyConnect VPN plugin'
            'qt6-webengine: Cisco AnyConnect VPN plugin')
provides=(plasma-nm)
conflicts=(plasma-nm)
source=(https://invent.kde.org/jaminfan/plasma-nm/-/archive/v$_pkgver/plasma-nm-v$_pkgver.tar.gz)
sha256sums=('614c826477d2a5b6f91e04751b8d13dea2812d9711b60c2e74ad567a76eccc06')

build() {
  [ -d build ] && rm -r build
  cmake -B build -S plasma-nm-v$_pkgver -D BUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
