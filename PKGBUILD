# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=akonadi-notes
pkgver=18.12.2
pkgrel=1
pkgdesc="Libraries and daemons to implement management of notes in Akonadi"
arch=(x86_64)
url="https://kontact.kde.org"
license=(LGPL)
depends=(kmime)
makedepends=(extra-cmake-modules akonadi boost)
source=("https://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('df9132aa0272897c4c4fb489edfe6c0fd5829a920b25254f249cea41f758c066'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

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
