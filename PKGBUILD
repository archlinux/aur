
pkgname=python-openmesh
pkgver=1.1.0
pkgrel=1
pkgdesc="OpenMesh Python bindings"
arch=('i686' 'x86_64')
url="http://www.openmesh.org"
license=('BSD')
makedepends=('cmake')
depends=('openmesh' 'python')
source=("https://graphics.rwth-aachen.de:9000/OpenMesh/openmesh-python/-/archive/${pkgver}/openmesh-python-${pkgver}.tar.bz2"
        CMakeLists.txt)
sha256sums=('7232523674a9dbf7db382a5ef43eeab57c8b296a6a0289d84b38b7b294262db4'
            SKIP)

prepare() {
  cd "${srcdir}/openmesh-python-${pkgver}"
  cp "${srcdir}"/CMakeLists.txt .
}

build() {
  cd "${srcdir}/openmesh-python-${pkgver}"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_SITE_PACKAGES=lib/python/3.6/site-packages \
    ..
  make
}

package() {
  cd "${srcdir}"/openmesh-python-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
