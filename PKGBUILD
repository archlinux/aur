#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Flexible Collision Library."
url='https://github.com/flexible-collision-library'
pkgname=fcl
pkgver=0.4.0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=('boost' 'libccd')
optdepends=('octomap: collision detection with octrees'
            'tinyxml: support for global penetration depth test'
            'flann: support for fast approximate nearest neighbor searches')
_dir=fcl-${pkgver}
source=(https://github.com/flexible-collision-library/fcl/archive/${pkgver}.tar.gz)
sha256sums=('1bea2cd5ee6034166d42860a6c5577f807c81f9f54d09dd680fb9bdf58d46747')

build() {
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  cmake ${srcdir}/${_dir} \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

#check() {
#    cd "${srcdir}/build/test"
#    make test
#}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
