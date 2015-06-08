# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=icet
_pkgname=IceT
pkgver=2.1.1
_pkgver=2-1-1
pkgrel=2
pkgdesc="High-performance sort-last parallel rendering library"
arch=('i686' 'x86_64')
url="http://icet.sandia.gov/"
license=('BSD')
makedepends=('cmake')
depends=('libgl' 'openmpi' 'freeglut' 'glu' 'libxmu')
source=("http://icet.sandia.gov/_assets/files/${_pkgname}-${_pkgver}.tar.gz")

sha256sums=('6eaf0442bf6832ce6c8a50805cf9279894fbcd5886cf6ea214b09d24f111fa33')

prepare(){
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  rm -rf build
  mkdir -p build
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/build"

  cmake ..\
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DICET_USE_OPENGL=ON \
    -DICET_USE_MPI=ON

  make
}

#check(){
  #cd "${srcdir}/${_pkgname}-${_pkgver}/build"
  #make test
#}

package(){
  cd "${srcdir}/${_pkgname}-${_pkgver}/build"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
