pkgname=openvolumemesh
pkgver=3.3.1
pkgrel=1
pkgdesc="A generic C++ data structure for arbitrary polyhedral meshes"
arch=('x86_64')
url="http://www.openvolumemesh.org"
license=('LGPL')
depends=('gcc-libs')
makedepends=('cmake')
source=("git+https://gitlab.vci.rwth-aachen.de:9000/OpenVolumeMesh/OpenVolumeMesh.git#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/OpenVolumeMesh"
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON \
      -DOVM_ENABLE_APPLICATIONS=OFF \
      -DOVM_ENABLE_UNITTESTS=OFF \
      -DOVM_ENABLE_EXAMPLES=OFF \
      -DOVM_BUILD_DOCUMENTATION=OFF \
      .
  make
}

package() {
  cd "${srcdir}"/OpenVolumeMesh
  make DESTDIR="${pkgdir}" install
}
