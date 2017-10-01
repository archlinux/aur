# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=("python2-espressopp")
pkgver=1.9.4.1
pkgrel=1
pkgdesc="ESPResSo++ is an extensible, flexible, fast and parallel simulation software for soft matter research."
url="http://www.espresso-pp.de/"
license=("GPL")
arch=(i686 x86_64)
depends=('fftw' 'openmpi' 'python2' 'boost' 'python2-mpi4py')
optdepends=()
makedepends=('cmake' 'doxygen')
source=(
https://github.com/espressopp/espressopp/archive/v${pkgver}.tar.gz
)
sha1sums=('7ffed56799d0719bf2a98157f343d99352742c23')

build() {

  #Real Configuration
  mkdir -p ${srcdir}/python2
  msg2 "Building python2 version"
  cd ${srcdir}/python2
  pwd
  cmake ../espressopp-${pkgver} \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_CXX_COMPILER=mpicxx \
         -DCMAKE_C_COMPILER=mpicc \
         -DPYTHON_EXECUTABLE=/usr/bin/python2 \
         -DEXTERNAL_BOOST=ON \
         -DCMAKE_USE_RELATIVE_PATHS=ON  
  make
}

package() {
  msg2 "Making python2 executables"
  cd ${srcdir}/python2
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/bin
}

