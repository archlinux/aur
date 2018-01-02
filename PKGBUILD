# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kmarkdownwebview
pkgver=0.4.0
pkgrel=1
pkgdesc='KPart for rendering Markdown content'
url='https://www.kde.org'
license=(LGPL)
arch=(i686 x86_64)
depends=(kparts qt5-webengine)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('38b72ba6fa4b513002e7873d2b774e50d676fc878a38b18e6eb9636b53b4c29d'
            'SKIP')
validpgpkeys=(E191FD5BE6F46870F09E82B2024E7FB43D015474) # Friedrich W. H. Kossebau <kossebau@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
