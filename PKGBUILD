# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kmarkdownwebview
pkgver=0.5.2
pkgrel=1
pkgdesc='KPart for rendering Markdown content'
url='https://www.kde.org'
license=(LGPL)
arch=(i686 x86_64)
depends=(kparts qt5-webengine)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('c62b7f61a93b9f3252d1330b3f021aba3155aa61f2fd059f150d59bd9ad61149'
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
