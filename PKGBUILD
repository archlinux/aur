# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=5.9.95
pkgrel=1
pkgdesc="Plasma applet and services for creating encrypted vaults"
arch=(i686 x86_64)
url="https://www.kde.org/"
license=(LGPL)
depends=(plasma-framework libksysguard)
makedepends=(extra-cmake-modules python)
source=("https://download.kde.org/unstable/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('26c6152e9f9cc1b1d112417b4a8f27972bf9203e4a4c62831197f30688fdd017'
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
