# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=kdsoap-qt5
_pkgname=kdsoap
pkgver=2.3.0
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
license=(GPL3 LGPL custom)
arch=(x86_64)
url='https://github.com/KDAB/KDSoap'
depends=(qt5-base)
makedepends=(cmake)
source=(https://github.com/KDAB/KDSoap/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('d2184951145cb768cc30376a10701be13869a164c1272d09f831ba2d195f02de'
            'SKIP')
validpgpkeys=(E86C000370B1B9E2A9191AD53DBFB6882C9358FB) # KDAB Products (user for KDAB products) <info@kdab.com>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DKDSoap_QT6=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname-$pkgver/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
