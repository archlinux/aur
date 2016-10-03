# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
pkgname=astrometry.net
pkgver=0.67
pkgrel=3
pkgdesc="Automatic recognition of astronomical images"
arch=('i686' 'x86_64')
url="http://astrometry.net/"
license=("GPL")
depends=('bzip2' 'cairo' 'libpng' 'libjpeg-turbo' 'cfitsio' 'gsl' 'python2'
'python2-numpy' 'python2-pyfits')
makedepends=('make' 'gcc')
source=("https://github.com/dstndstn/${pkgname}/archive/${pkgver}.tar.gz")

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -e 's/python/python2/' -i util/makefile.common blind/Makefile util/Makefile sdss/Makefile libkd/Makefile
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PYTHON=/usr/bin/python2 all py extra
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make INSTALL_DIR=${pkgdir}/usr \
	    DATA_INSTALL_DIR=${pkgdir}/usr/share/astrometry \
	    LIB_INSTALL_DIR=${pkgdir}/usr/lib/ \
	    ETC_INSTALL_DIR=${pkgdir}/etc \
	    FINAL_DIR=/usr \
	    DATA_FINAL_DIR=/usr/share/astrometry \
	install
}
md5sums=('b7b3277bb9779ef19b06b8e2377a63d4')
