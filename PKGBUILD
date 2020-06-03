# Maintainer: maisvendoo <maisvendoo@gmail.com>
# Contributor: jmf <jmf at mesecons dot net>

pkgname=osgqt-rrs
pkgver=3.7.0
_pkgver=3.7.0
pkgrel=1
pkgdesc="osgQt version for using with Russian Raylway Simulator"
arch=('x86_64')
url="http://www.openscenegraph.org"
license=('LGPL3')
depends=('openscenegraph-git' 'qt5-base')
makedepends=('cmake')
optdepends=()
conflicts=('osgqt')
source=("osgQt::git+https://github.com/maisvendoo/osgQt.git#branch=master")
sha256sums=('SKIP')
options=(!strip)

prepare() {
  mkdir -p "${srcdir}/build-debug"
  mkdir -p "${srcdir}/build-release"
}

build() {
  cd "${srcdir}/build-debug"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBRARY_OUTPUT_PATH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Debug ../osgQt
    
  make  -j8  
  
  cd "${srcdir}/build-release"  
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBRARY_OUTPUT_PATH=/usr/lib \
    ../osgQt
    
    make 
}

package(){
  cd "${srcdir}/build-debug"
  make DESTDIR="$pkgdir" install
  
  cd "${srcdir}/build-release"
  make DESTDIR="$pkgdir" install  
  
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}
