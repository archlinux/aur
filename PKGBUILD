# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=("python2-espressopp")
pkgver=1.9.2
pkgrel=1
pkgdesc="ESPResSo++ is an extensible, flexible, fast and parallel simulation software for soft matter research."
url="http://www.espresso-pp.de/"
license=("GPL")
arch=(i686 x86_64)
depends=('fftw' 'openmpi' 'python2' 'boost' 'python2-mpi4py')
optdepends=()
makedepends=('cmake' 'doxygen')
source=(
http://www.espresso-pp.de/Download/espressopp-${pkgver}.tgz
)
sha1sums=('7e9ad6ed25448275fa33e63fbf2e00c9399acf87')

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

