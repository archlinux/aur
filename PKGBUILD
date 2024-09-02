# Maintainer: Zeph <zeph33@gmail.com>
# Maintainer: Artyom Grinyov (LordTermor)
# Maintainer: Zorin Arch (ZorinArch)

pkgname=pamac-tray-icon-plasma
pkgver=0.1.4
pkgrel=1
_commit='58353a1b0fc4d1ba0957883da27c63aa04d0cdf2'
sha256sums=('61a697f3792fcf51ad52d82ab7ad5b79083f5f0cbba5e13aa48534932b698e74')

url="https://gitlab.com/LordTermor/$pkgname"

pkgdesc="Pamac tray icon for plasma users"
arch=('x86_64')
license=('GPL3')
depends=('libpamac>=11.0.0' 'qt6-base>=6.2.0' 'knotifications' 'kstatusnotifieritem')
makedepends=('cmake')
conflicts=('pamac-tray-appindicator')
options=(!emptydirs)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE="None" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ../$pkgname-$_commit
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

