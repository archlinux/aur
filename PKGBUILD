# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=(votca-csg)
pkgver=1.3
pkgrel=1
pkgdesc="Versatile Object-oriented Toolkit for Coarse-graining Applications (VOTCA) is a package intended to reduce the amount of routine work when doing systematic coarse-graining of various systems."
url="http://www.votca.org/"
license=("Apache")
arch=(i686 x86_64)
depends=('python2' 'votca-tools')
#depends=('python2' 'votca-tools' 'gromacs-5.0-complete')
optdepends=('python2-espressopp')
makedepends=('cmake' 'doxygen')
source=(https://github.com/votca/csg/archive/v${pkgver}.tar.gz)
sha1sums=('4b7ec10f4b59852c28f6b3c203412a4a1d178188')

build() {
  source /etc/profile.d/GMXRC.bash
  msg2 "Building votca-csg"
  #Real Configuration
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build
  cmake ../csg-${pkgver} \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DWITH_RC_FILES=OFF \
         -DEXTERNAL_BOOST=ON

#         -DWITH_GMX_DEVEL=ON 
  make
}

package() {
  source /etc/profile.d/GMXRC.bash
  msg2 "Making executables"
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

