# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-stash
pkgver=1.0
pkgrel=1
pkgdesc="A kio slave and daemon to stash discontinuous file selections"
arch=(i686 x86_64)
url="https://www.kde.org/"
license=(GPL2)
depends=(kio)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('d8ef422924e24317122524fb1d1e439d45ff9281a502a6258a782cfe0d8c8eaa')

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
