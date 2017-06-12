# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=5.9.96
pkgrel=1
pkgdesc="Plasma applet and services for creating encrypted vaults"
arch=(i686 x86_64)
url="https://www.kde.org/"
license=(LGPL)
depends=(plasma-framework libksysguard encfs)
makedepends=(extra-cmake-modules python)
optdepends=('encfs: to use encFS for encryption' 'cryfs: to use cryFS for encryption')
source=("https://download.kde.org/unstable/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('1f1868c42df15e1584bb29efc51b1e533f95f1f8374021a7a12d4945d9b1bc00'
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
