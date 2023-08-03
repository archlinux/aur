# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: Niklas <dev@n1klas.net>

pkgname=qt6-mqtt
_qtver=6.5.2
pkgver=${_qtver/-/}
pkgrel=2
pkgdesc="Module to implement MQTT protocol v3.1/3.1.1/5.0 for Qt 6"
arch=(x86_64)
url="http://qt-project.org/"
license=(GPL3 custom)
depends=(qt6-base)
makedepends=(cmake git ninja)
source=("git+https://code.qt.io/qt/qtmqtt.git#tag=v$_qtver")
sha512sums=('SKIP')
_pkgfqn=${pkgname/6-/}

build() {
  cmake -B build -S $_pkgfqn \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgfqn/LICENSES/Qt-GPL-exception-1.0.txt \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}
