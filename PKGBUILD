# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=pdal-wrench
_pkgname=wrench
pkgver=1.4.0
pkgrel=1
pkgdesc="A tool to manipulate point cloud data using PDAL"
arch=('x86_64')
url="https://github.com/PDAL/wrench"
license=('MIT')
depends=('pdal' 'boost' 'proj' 'gdal')
makedepends=('cmake' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PDAL/wrench/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('48a425c5b7b6a9c3862a109c70788c39ce003101bbf1aaf3cb30461cc46f2b9d')

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
