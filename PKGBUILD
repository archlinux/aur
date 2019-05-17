# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=upnp-player-qt
pkgver=0.2.git20170530
pkgrel=2
_commit=feda500b33eeb5b0b5c05f34e2fe632acb6649ad
pkgdesc='Upnp layer build with Qt5'
url='https://gitlab.com/homeautomationqt/upnp-player-qt'
arch=(x86_64)
license=(LGPL3)
depends=(kdsoap)
makedepends=(extra-cmake-modules qt5-declarative qt5-websockets)
source=($pkgname-$pkgver.tar.gz::"https://gitlab.com/homeautomationqt/upnp-player-qt/repository/$_commit/archive.tar.gz")
sha256sums=('6c8b2f44dc457d2368c9b599adb469083c25b7ac80030a8a3856560f1b4403f9')

prepare() {
  cd $pkgname-*/
  mkdir -p build
}

build() {
  cd $pkgname-*/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd $pkgname-*/build
  make DESTDIR="$pkgdir" install
}
