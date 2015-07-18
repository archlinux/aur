# $Id$
# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warnings can be ignored, only saying hard-coded references to x86_64 and i686 should be made into ${CARCH}, which is not possible because the Makefiles are named based on x86_64 and i386.  (i686 vs i386 naming.)
# * Helpful how-to (not mine): http://greg.porter.name/wiki/HowTo:iometer

pkgname=iometer
pkgver=1.1.0
pkgrel=1
pkgdesc='Dynamo I/O subsystem benchmark measurement tool for single and clustered systems'
#        The iometer project has two executables -- iometer and dynamo
#        Iometer can only run on Windows.  Iometer is the GUI that drives dynamo, running on that machine or on others.
#        Dynamo can run on Windows or Unix.
#        There is no standalone way to run Dynamo.  A Windows platform with iometer installed is required to drive it.
arch=('x86_64' 'i686')
url='http://www.iometer.org/'
license=('GPL2')
depends=('libaio' 'gcc-libs')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-stable/${pkgver}/${pkgname}-${pkgver}-src.tar.bz2")
md5sums=('44ab0450d789f3f810a66d84f8052a7a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  
  if [[ "${CARCH}" == 'x86_64' ]]; then
    make -f Makefile-Linux.x86_64 dynamo
  elif [[ "${CARCH}" == 'i686' ]]; then
    make -f Makefile-Linux.i386 dynamo
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  # Its Makefiles don't support "make install" (even with -f Makefile-Linux.<arch>)
  install -Dm755 dynamo "${pkgdir}/usr/bin/dynamo"
}
