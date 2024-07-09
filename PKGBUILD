# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=mapbox-polylabel
pkgver=2.0.1
pkgrel=1
pkgdesc="A fast algorithm for finding the pole of inaccessibility of a polygon"
arch=('any')
url="https://github.com/mapbox/polylabel"
license=('ISC')
checkdepends=('gcc13' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapbox/polylabel/archive/v${pkgver}.tar.gz")
sha256sums=('d51ec39f9f1bc46c551dfdf642f72057a8c2cde2c5e89bc70e0bd712fad63a75')

check() {
  cd polylabel-"${pkgver}"
  rm -rf .mason
  # Mason is required to download some dependencies
  git clone --depth=1 --branch=v0.23.0 https://github.com/mapbox/mason.git .mason
  # GCC 14 won't build the test (without some modifications)
  CC=gcc-13 CXX=g++-13 make test
}

package() {
  install -dm755 "$pkgdir"/usr/include/mapbox "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm644 "$srcdir"/polylabel-"$pkgver"/include/mapbox/*.hpp "$pkgdir"/usr/include/mapbox/

  # License
  install -Dm644 "$srcdir"/polylabel-"$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
