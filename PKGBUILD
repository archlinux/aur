# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=kdsoap
pkgver=2.1.1
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
license=(GPL3 LGPL custom)
arch=(x86_64)
url='https://github.com/KDAB/KDSoap'
depends=(qt5-base)
makedepends=(cmake)
source=(https://github.com/KDAB/KDSoap/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('aed57f6b200ddf762f5d2898f7e9228dd0700881c4491aefe4006f7fa5f5c627'
            'SKIP')
validpgpkeys=(E86C000370B1B9E2A9191AD53DBFB6882C9358FB) # KDAB Products (user for KDAB products) <info@kdab.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
