# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=bluez-qt
pkgname=${_name}5
pkgver=5.116.0
pkgrel=2
pkgdesc='Qt wrapper for Bluez 5 DBus API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(GPL2)
depends=(qt5-base bluez)
makedepends=(extra-cmake-modules qt5-declarative)
optdepends=('qt5-declarative: QML bindings')
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('1bab900d6984f4cbec517354cd6ffb11fd1f50887c5bf711ff4305376e039627'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DUDEV_RULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
