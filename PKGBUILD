# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=akonadi-contacts
pkgname=akonadi-contacts5
pkgver=23.08.5
pkgrel=3
pkgdesc='Libraries and daemons to implement Contact Management in Akonadi'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL)
depends=(libakonadi5 kcontacts5 kmime5 prison5 grantleetheme5)
makedepends=(extra-cmake-modules)
conflicts=('akonadi-contacts<24')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('e7a4b37c6bb4dbdb074398a48050b3ea63b1ffd8b576f3efa9cef56759cf4251'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/share/{akonadi,locale} # Conflicts with Qt5 version
}
