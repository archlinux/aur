#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Flexible Collision Library."
url='https://github.com/flexible-collision-library'
pkgname=fcl
pkgver=0.3.2
arch=('i686' 'x86_64')
pkgrel=2
license=('BSD')
makedepends=('cmake')
depends=('boost' 'libccd')
optdepends=('octomap: collision detection with octrees'
'tinyxml: support for global penetration depth test'
'flann: support for fast approximate nearest neighbor searches')
_dir=fcl-${pkgver}
source=(https://github.com/flexible-collision-library/fcl/archive/${pkgver}.tar.gz)
md5sums=('b12246df3f4e1d0768ce1e46a52900ff')

build() {
  rm -rf ${srcdir}/build && mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  cmake ${srcdir}/${_dir} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

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
