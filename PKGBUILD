# Maintainer:  Florian Lindner <florian.lindner@xgm.de>

pkgname=precice
pkgver=2.2.1
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
sha256sums=('bca8cedfb5c86656e4fdfaca5cb982b861f9aba926538fa4411bc0d015e09c1f')

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
