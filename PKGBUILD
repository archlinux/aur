# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=telepathy-qt
pkgver=0.9.8
pkgrel=2
arch=(x86_64)
url="https://telepathy.freedesktop.org/wiki/"
license=(LGPL)
pkgdesc="A library for Qt-based Telepathy clients"
depends=(qt5-base telepathy-farstream)
makedepends=(cmake doxygen python qt5-tools)
source=("https://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('bf8e2a09060addb80475a4938105b9b41d9e6837999b7a00e5351783857e18ad'
            'SKIP')
validpgpkeys=('AA33B0D27868E36C151780F0FE0B6D736B1195ED') # Alexandr Akulich

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_EXAMPLES=OFF \
    -DENABLE_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
