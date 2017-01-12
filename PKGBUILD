# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=akonadi-notes
pkgver=16.12.1
pkgrel=1
pkgdesc="Libraries and daemons to implement management of notes in Akonadi"
arch=(i686 x86_64)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
depends=(kmime)
makedepends=(extra-cmake-modules python akonadi boost)
source=("http://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
md5sums=('e4c490bbd3801155d0e4b38f086bd578'
         'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7) # Albert Astals Cid <aacid@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
