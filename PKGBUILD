# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve
pkgver=3.1.7
pkgrel=1
pkgdesc="Multiprecision rootfinder for complex roots of univariate polynomials"
url="http://numpi.dm.unipi.it/software/mpsolve"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmp' 'mpfr')
makedepends=('gcc-fortran')
optdepends=('cython: Python bindings'
            'doxygen: documentation (optional build-time dependency)'
            'gtk3: Graphical debugger'
            'octave: Octave bindings'
            'qt4: Graphical interface xmpsolve')
options=(!libtool)
source=("http://numpi.dm.unipi.it/_media/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('3e3d750ad3acc1f274015d0c418d3d6fadf5ed3aa1fc57680dd38b994d2e8305')

build () {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-debug
  make
}

check () {
  cd ${srcdir}/${pkgname}-${pkgver}
  make check
}

package () {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  if [ -f ${pkgdir}/usr/share/octave/octave_packages ]; then
    sed -e "s/$(echo "${pkgdir}" | sed -e 's/[\/&]/\\&/g')//g" -i ${pkgdir}/usr/share/octave/octave_packages
  fi
}
