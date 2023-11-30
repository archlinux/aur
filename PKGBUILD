# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkcompactdisc
pkgver=24.01.80
pkgrel=1
pkgdesc='A library for interfacing with CDs'
url='https://www.kde.org/'
arch=(x86_64)
license=(GPL LGPL FDL)
depends=(alsa-lib
         gcc-libs
         glibc
         ki18n
         phonon-qt6
         qt6-base
         solid)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/unstable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('7b6a53609d31284eda58f52dd6c5170b0fe7ba88e768a90327d90e4c3cd53d9a'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
