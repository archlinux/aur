# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkcompactdisc
pkgver=18.08.1
pkgrel=1
pkgdesc="A library for interfacing with CDs"
url='https://www.kde.org/applications/multimedia/'
arch=(x86_64)
license=(GPL LGPL FDL)
depends=(solid ki18n kcoreaddons phonon-qt5)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('537199c9cf86e46378d708e25f3ce05c8b3f1fdcd69abdfee38191755f40b11c'
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
