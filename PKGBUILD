
pkgname=python-openmesh
pkgver=1.1.3
pkgrel=1
pkgdesc="OpenMesh Python bindings"
arch=('i686' 'x86_64')
url="http://www.openmesh.org"
license=('BSD')
makedepends=('cmake' 'pybind11')
depends=('openmesh' 'python')
source=("https://graphics.rwth-aachen.de:9000/OpenMesh/openmesh-python/-/archive/${pkgver}/openmesh-python-${pkgver}.tar.bz2"
        CMakeLists.txt)
sha256sums=('488bcdcb6f7e392801a3a3fc1021c2ebad298d5da6cc16946bd43276bc88f80f'
            SKIP)

prepare() {
  cd "${srcdir}/openmesh-python-${pkgver}"

  # https://www.graphics.rwth-aachen.de:9000/OpenMesh/openmesh-python/issues/20
  cp "${srcdir}"/CMakeLists.txt .
}

build() {
  cd "${srcdir}/openmesh-python-${pkgver}"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_SITE_PACKAGES=lib/python/3.7/site-packages \
    ..
  make
}

package() {
  cd "${srcdir}"/openmesh-python-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
