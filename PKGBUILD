# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=akonadi-notes
pkgname=${_name}5
pkgver=23.08.5
pkgrel=2
pkgdesc='Libraries and daemons to implement management of notes in Akonadi'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL)
depends=(kmime5)
makedepends=(extra-cmake-modules qt5-tools doxygen)
conflicts=('akonadi-notes<24')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('fe3a8eccc987d9a84bd01235ac02b78ed432e43b9323757b0042dfb8aae5838e'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/share/locale # Conflicts with Qt5 version
}
