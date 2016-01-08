# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=(votca-tools)
pkgver=1.2.4
pkgrel=1
pkgdesc="Versatile Object-oriented Toolkit for Coarse-graining Applications (VOTCA) is a package intended to reduce the amount of routine work when doing systematic coarse-graining of various systems. (LIBRARY)"
url="http://www.votca.org/"
license=("Apache")
arch=(i686 x86_64)
depends=('fftw' 'boost' 'sqlite' 'gsl' 'expat')
optdepends=()
makedepends=('cmake' 'doxygen')
source=(
https://github.com/votca/tools/archive/v${pkgver}.tar.gz
)
sha1sums=('45a06b485dbafdd05a3dae30c8106e15247a8a16')

build() {
  msg2 "Building votca-tools"
  #Real Configuration
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  cmake ../tools-${pkgver} \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DWITH_RC_FILES=OFF \
         -DEXTERNAL_BOOST=ON 
  make
}

package() {
  msg2 "Making executables"
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

