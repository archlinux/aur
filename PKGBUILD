# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=kdsoap
pkgver=1.9.1
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
license=(GPL3 LGPL custom)
arch=(x86_64)
url='https://github.com/KDAB/KDSoap'
depends=(qt5-base)
makedepends=(cmake)
source=("https://github.com/KDAB/KDSoap/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('a020ea26e91a2bcdbfa7bc631870ed07be2c583ae29114cfe72a5a94e0e93d27'
            'SKIP')
validpgpkeys=(E86C000370B1B9E2A9191AD53DBFB6882C9358FB) # KDAB Products (user for KDAB products) <info@kdab.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
