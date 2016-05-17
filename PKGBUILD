# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=qtviewer
pkgver=2.5.1
pkgrel=1
pkgdesc="Real-Time Terrain Rendering. Display high-resolution geospatial terrain data at real-time."
arch=('i686' 'x86_64')
url='http://www.open-terrain.org'
license=('GPL')
provides=("$pkgname")
depends=('libmini' 'libgrid-svn' 'openscenegraph' 'glu')
makedepends=('cmake' 'subversion' 'qt4')
optdepends=()
options=('staticlibs')
source=("http://www.open-terrain.org/uploads/ZIP/QTVIEWER-${pkgver}.zip")
md5sums=('6e6496fcf4f0fc8a207261b0625c4a7f')

build() {
  cd "${pkgname}"  

  #Build
  if [[ -d "${srcdir}/build" ]]; then
    (rm -rf ${srcdir}/build)
  fi

  mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_WITH_QT5=OFF \
  ../${pkgname}

  make -j2
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install || return 1  
}
