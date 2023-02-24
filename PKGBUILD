# Maintainer: mel <mel@nie.rs>
# Contributor Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Antonio Rojas

pkgname=prison-git
_name=${pkgname%-git}
pkgver=v5.102.0.r8.gd195b3a
pkgrel=1
pkgdesc="Barcode api currently offering a nice Qt api to produce QRCode barcodes and DataMatrix barcodes. (GIT version)"
arch=(x86_64)
url='https://invent.kde.org/frameworks/prison'
license=(LGPL)
depends=(libdmtx qrencode qt6-declarative zxing-cpp)
makedepends=(extra-cmake-modules git)
conflicts=(prison)
provides=(prison)
source=("git+https://invent.kde.org/frameworks/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
