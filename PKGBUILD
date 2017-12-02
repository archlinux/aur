# Maintainer: Michele Mocciola <mickele>

pkgname=libbatch
pkgver=2.3.1
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - KERNEL Module"
url="http://www.salome-platform.org"
depends=('python2')
makedepends=('swig2')
arch=('i686' 'x86_64')
license=('LGPL')
source=("http://files.salome-platform.org/Salome/other/libBatch-${pkgver}.tar.gz")

_installdir=/usr
_source=libBatch-${pkgver}

# uncomment to build from git
#_source=libbatch
#prepare() {
#  msg "Connecting to git server..."
#  if [[ -d ${_source} ]] ; then
#     rm -rf ${_source}
#  fi
#  git clone git://git.salome-platform.org/tools/${_source}.git
#  cd ${_source}
#  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}
#  msg "GIT checkout done or server timeout"
#}

build() {
  rm -rf "$srcdir/$_source/build"
  mkdir -p "$srcdir/$_source/build"
  cd "$srcdir/$_source/build"

  cmake .. \
     -DCMAKE_INSTALL_PREFIX=${_installdir} \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2

  make
}

package() {
  cd "${srcdir}/${_source}/build"

  make DESTDIR="$pkgdir" install

}
md5sums=('fb0dc1228139fd5c0c25065982084d7e')
