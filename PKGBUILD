# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Previous Maintainer: mel <mel@nie.rs>
# Contributor Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Antonio Rojas

pkgname=prison-git
_name=${pkgname%-git}
pkgver=v6.7.0.r2.g4cbf603
pkgrel=1
pkgdesc="Barcode api currently offering a nice Qt api to produce QRCode barcodes and DataMatrix barcodes. (GIT version)"
arch=(x86_64)
url='https://invent.kde.org/frameworks/prison'
license=(LGPL)
depends=(libdmtx qrencode qt6-declarative qt6-multimedia zxing-cpp)
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
