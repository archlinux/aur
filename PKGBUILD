# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdav2
pkgver=0.1.0
pkgrel=1
pkgdesc="A DAV protocol implementation with KJobs"
arch=(i686 x86_64)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
depends=(qt5-xmlpatterns kcoreaddons)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
sha256sums=('0e4028c4f1f76b315bb54eb7d3e216e7456a445085c47cdca0f7a58368fe6c36')

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
