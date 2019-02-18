# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kmarkdownwebview
pkgver=0.5.5
pkgrel=1
pkgdesc='KPart for rendering Markdown content'
url='https://www.kde.org'
license=(LGPL)
arch=(i686 x86_64)
depends=(kparts qt5-webengine)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('3bbdde1b52d1e11045df6a05b14484331efcfe740a98708e4bdfa334a8f3ee96'
            'SKIP')
validpgpkeys=(E191FD5BE6F46870F09E82B2024E7FB43D015474) # Friedrich W. H. Kossebau <kossebau@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
