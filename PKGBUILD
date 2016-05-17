# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname='libmini'
_pkgname=mini
pkgver=11.5.3
pkgrel=1
pkgdesc="Real-Time Terrain Rendering. Display high-resolution geospatial terrain data at real-time."
arch=('i686' 'x86_64')
url='http://www.open-terrain.org'
license=('GPL')
provides=("$pkgname")
depends=('libsquish-svn' 'openscenegraph' 'glu')
makedepends=('cmake' 'subversion')
optdepends=()
provides=('libmini')
conflicts=('libmini-svn')
options=('staticlibs')
source=("http://www.open-terrain.org/uploads/ZIP/MINI-${pkgver}.zip")
md5sums=('7bf2bf6d3ec0c4252aa79db4f80fe4a7')


build() {
  cd "${_pkgname}"  

  #Build
  if [[ -d "${srcdir}/build" ]]; then
    (rm -rf ${srcdir}/build)
  fi

  mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_MINI_SFX=ON \
  -DBUILD_MINI_EXAMPLE=ON \
  -DBUILD_MINI_TOOLS=OFF \
  -DBUILD_MINI_VIEWER=OFF \
  -DBUILD_MINI_WITH_OPENTHREADS=OFF \
  ../${_pkgname}

  make -j5
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install || return 1  
}
