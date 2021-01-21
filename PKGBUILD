# Maintainer:  Florian Lindner <florian.lindner@xgm.de>

pkgname=precice
pkgver=2.2.0
pkgrel=1
pkgdesc="A Coupling Library for Partitioned Multi-Physics Simulations on Massively Parallel Systems"
arch=('x86_64')
url="https://www.precice.org"
license=('LGPL3')
depends=('boost' 'libxml2' 'openmpi' 'petsc' 'python-numpy')
makedepends=('cmake' 'eigen')
optdepends=()
provides=('precice')
source=("$pkgname-$pkgver.tar.gz::https://github.com/precice/precice/archive/v${pkgver}.tar.gz")
sha256sums=('f8c4e0810dcaeb6a40a0fcab64b95c899f0121c968e0730416d4d2a97d39d0c4')

build() {
    cd "${pkgname}-${pkgver}"
    cmake . \
          -DCMAKE_BUILD_TYPE=None \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_SHARED_LIBS=ON \
          -DPRECICE_MPICommunication=ON \
          -DPRECICE_PETScMapping=ON \
          -DPRECICE_PythonActions=ON \
          -Wno-dev
    make
}

# check() {
#     cd "${pkgname}-${pkgver}"
#     make test
# }

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
