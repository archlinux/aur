# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kidentitymanagement
pkgname=${_name}5
pkgver=23.08.5
pkgrel=2
pkgdesc='KDE PIM libraries'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL)
depends=(kpimtextedit5)
makedepends=(extra-cmake-modules doxygen qt5-tools)
conflicts=('kidentitymanagement<24')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('bcd7f7ef26a24b2d198a7739bdc8b4f3868d42e05355173fbc91a95220d77201'
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
