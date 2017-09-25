# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kmarkdownwebview
pkgver=0.1.0
pkgrel=1
pkgdesc='KPart for rendering Markdown content'
url='https://www.kde.org'
license=(LGPL)
arch=(i686 x86_64)
depends=(kparts qt5-webengine)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('361fec6c4fa9396975e788cfe759b1c45a2ccfc2b83e64b5105869ef312a5410'
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
