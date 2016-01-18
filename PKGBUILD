# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=(votca-tools)
pkgver=1.3
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
sha1sums=('1a18ccd1e37af73af118e0abb08fdd48f1e0ebd9')

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

