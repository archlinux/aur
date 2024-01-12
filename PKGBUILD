# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=grantleetheme
pkgname=${_name}5
pkgver=23.08.4
pkgrel=1
pkgdesc='Library for Grantlee theming support'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL)
depends=(grantlee knewstuff5)
makedepends=(extra-cmake-modules)
conflicts=('grantleetheme<24')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('d81c9454d86f568218f852dbe31e67d0e547ea6d3ead5b1fe5c7267f20a5c32d'
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
