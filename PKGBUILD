# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=akonadi-notes
pkgver=24.05.2
pkgrel=1
pkgdesc='Libraries and daemons to implement management of notes in Akonadi'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         ki18n
         kmime
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             qt6-doc
             qt6-tools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('aaf37d4a840a4a3a25e955eb7b60e650d2b7f2ab30bf77c48774744de5b26131'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
