# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=5.11.3
pkgrel=1
pkgdesc="Plasma applet and services for creating encrypted vaults"
arch=(i686 x86_64)
url="https://www.kde.org/"
license=(LGPL)
groups=(plasma)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules python)
optdepends=('encfs: to use encFS for encryption' 'cryfs: to use cryFS for encryption')
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('2a8a6e0dc5eb96ceff9424b19deb3e0d1e888d45a72e6ba81bf1dc4bc318c28b'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E')  # Jonathan Riddell

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
