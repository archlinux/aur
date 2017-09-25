# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ktexteditorpreviewplugin
pkgver=0.1.0
pkgrel=1
pkgdesc='Plugin for previewing content using the KTextEditor Framework'
url='https://www.kde.org'
license=(LGPL)
arch=(i686 x86_64)
depends=(ktexteditor)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('21e17a97fe2b942991ce564371ce822564397488847f8d21d7d5b24d4c120796'
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
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
