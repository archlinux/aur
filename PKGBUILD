# Maintainer: Zeph <zeph33@gmail.com>
# Maintainer: Artyom Grinyov (LordTermor)
# Maintainer: Zorin Arch (ZorinArch)

pkgname=pamac-tray-icon-plasma
pkgver=0.1.3
pkgrel=1
_commit='e39571330664045a145ab3a15c0a1a925527cd4d'
sha256sums=('637e061f4c78e54951dc575fc55e9e2c2fd0e53b9ca6eb65b23bd0f6cf1654c6')

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
 
