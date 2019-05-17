# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=kdsoap
pkgver=1.8.0
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
license=(GPL3 LGPL custom)
arch=(x86_64)
url='https://github.com/KDAB/KDSoap'
depends=(qt5-base)
makedepends=(cmake)
source=("https://github.com/KDAB/KDSoap/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('e73fbaf57f01a6d45f8f0530861a8f528bf0216633c2c70617cec4434237e742'
            'SKIP')
validpgpkeys=(E86C000370B1B9E2A9191AD53DBFB6882C9358FB) # KDAB Products (user for KDAB products) <info@kdab.com>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
  make 
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
