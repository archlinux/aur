# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kimap2
pkgver=0.1.0
pkgrel=1
pkgdesc="Job-based API for interacting with IMAP servers"
arch=(i686 x86_64)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
depends=(kcoreaddons kmime)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('ee2851bbf0f881003fefaf79c37b219b6775e7088582adce5d594fd87cd58f44')

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
