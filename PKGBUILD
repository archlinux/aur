pkgname=python-openmesh
pkgver=1.2.1
pkgrel=1
pkgdesc="OpenMesh Python bindings"
arch=('x86_64')
url="http://www.openmesh.org"
license=('BSD')
makedepends=('cmake' 'pybind11')
depends=('openmesh' 'python')
source=("https://gitlab.vci.rwth-aachen.de:9000/OpenMesh/openmesh-python/-/archive/${pkgver}/openmesh-python-${pkgver}.tar.bz2"
        CMakeLists.txt)
sha256sums=('c852c76a0c6210a8b94c2600b85cf167ea41c4f7583a2ee682e098926f1ac5ed'
            SKIP)

prepare() {
  cd "${srcdir}/openmesh-python-${pkgver}"

  # https://www.graphics.rwth-aachen.de:9000/OpenMesh/openmesh-python/issues/20
  cp "${srcdir}"/CMakeLists.txt .
}

build() {
  cd "${srcdir}/openmesh-python-${pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build .
  make -C build
}

package() {
  cd "${srcdir}"/openmesh-python-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
