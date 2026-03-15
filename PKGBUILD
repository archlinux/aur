# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=kdsoap
pkgver=2.3.0
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
license=(GPL-3.0-or-later)
arch=(x86_64)
url='https://github.com/KDAB/KDSoap'
depends=(glibc
         libgcc
         libstdc++
         qt6-base)
makedepends=(cmake)
conflicts=(kdsoap-qt6)
provides=(kdsoap-qt6)
replaces=(kdsoap-qt6)
source=(https://github.com/KDAB/KDSoap/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('d2184951145cb768cc30376a10701be13869a164c1272d09f831ba2d195f02de'
            'SKIP')
validpgpkeys=(E86C000370B1B9E2A9191AD53DBFB6882C9358FB) # KDAB Products (user for KDAB products) <info@kdab.com>

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgbase-$pkgver/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
