# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=akonadi-notes
pkgver=16.08.3
pkgrel=1
pkgdesc="Libraries and daemons to implement management of notes in Akonadi"
arch=(i686 x86_64)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
depends=(kmime)
makedepends=(extra-cmake-modules python akonadi boost)
source=("http://download.kde.org/stable/applications/$pkgver/src/$pkgname-$pkgver.tar.xz")
md5sums=('e835c84238f1b40954417fc35e802797')

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
