# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=akonadi-contacts
pkgname=${_name}5
pkgver=23.08.3
pkgrel=2
pkgdesc='Libraries and daemons to implement Contact Management in Akonadi'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL)
depends=(libakonadi5 kcontacts5 kmime5 prison5 grantleetheme5)
makedepends=(extra-cmake-modules)
conflicts=('akonadi-contacts<24')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('19ec13cab213dad13854da82712eb6439a602d4afcc688dc2969f5e9a14bc94d'
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
  rm -r "$pkgdir"/usr/share/locale # Conflicts with Qt5 version
}
