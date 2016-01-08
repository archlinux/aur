# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=(votca-csg)
pkgver=1.2.4
pkgrel=1
pkgdesc="Versatile Object-oriented Toolkit for Coarse-graining Applications (VOTCA) is a package intended to reduce the amount of routine work when doing systematic coarse-graining of various systems."
url="http://www.votca.org/"
license=("Apache")
arch=(i686 x86_64)
depends=('python2' 'votca-tools' 'gromacs-5.0-complete')
optdepends=('python2-espressopp')
makedepends=('cmake' 'doxygen')
source=(https://github.com/votca/csg/archive/v${pkgver}.tar.gz)
sha1sums=('0ff663e19892579bc286ae01375b864fe8d2e5e8')

build() {
#  msg2 "Fixing python2 invokation"
#  cd ${srcdir}/${pkgname}-${pkgver}/share/scripts/inverse
#  sed -i 1s/python2*/python2/ *.py
  source /usr/local/gromacs/gromacs-5.0.7/bin/GMXRC
  msg2 "Building votca-csg"
  #Real Configuration
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  cmake ../csg-${pkgver} \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DWITH_RC_FILES=OFF \
         -DEXTERNAL_BOOST=ON \
         -DWITH_GMX_DEVEL=ON 
  make
}

package() {
  source /usr/local/gromacs/gromacs-5.0.7/bin/GMXRC
  msg2 "Making executables"
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

