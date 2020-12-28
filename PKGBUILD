# Maintainer: Zeph <zeph33@gmail.com>
# Maintainer: Artyom Grinyov (LordTermor)
# Maintainer: Zorin Arch (ZorinArch)

pkgname=pamac-tray-icon-plasma
pkgver=0.1.2
pkgrel=2
_commit='4c1d846750741b60239d4f5865d5bab987604611'
sha256sums=('41e897d5e7fb0757f4e929de20c9a7326041a6a5d147499173999856732a2feb')

url="https://gitlab.com/LordTermor/$pkgname"

pkgdesc="Pamac tray icon for plasma users"
arch=('x86_64')
license=('GPL3')
depends=('pamac>=10.0.2' 'qt5-base>=5.15.0' 'knotifications')
makedepends=('cmake')
conflicts=('pamac-tray-appindicator')
replaces=('pamac-tray-appindicator')
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
 
