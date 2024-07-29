# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=pdal-wrench
_pkgname=wrench
pkgver=1.1
pkgrel=1
pkgdesc="A tool to manipulate point cloud data using PDAL"
arch=('x86_64')
url="https://github.com/PDAL/wrench"
license=('MIT')
depends=('pdal' 'boost' 'proj' 'gdal')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PDAL/wrench/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fcb7a7cd5e4a62caeceb2a4d377eee39690ba0948da9c569d133c38fbe8e7113')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

# Optional: Run tests if available
# check() {
#   cd "$srcdir/${_pkgname}-${pkgver}/build"
#   make test
# }
