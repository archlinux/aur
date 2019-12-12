# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=akonadi-notes
pkgver=19.12.0
pkgrel=1
pkgdesc="Libraries and daemons to implement management of notes in Akonadi"
arch=(x86_64)
url="https://kontact.kde.org"
license=(LGPL)
depends=(kmime)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('3c91f2f2b47a786a537aec6037e702756cf77fa8aa0378e9ab9ba59aa08e4e29'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
