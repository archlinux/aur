# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=hpipm
pkgver=0.1.3
pkgdesc="High-performance interior-point-method QP solvers"
url='https://github.com/giaf/hpipm'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD 2-Clause')
makedepends=('cmake')
depends=('blasfeo')
source=("${pkgname}-${pkgver}::https://github.com/giaf/hpipm/archive/${pkgver}.tar.gz")
sha256sums=('1c8182577608db535762706064787eee143b981af94bf4690a840bdc1728623b')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DHPIPM_TESTING=OFF \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
