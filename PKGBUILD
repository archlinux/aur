# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve
pkgver=3.1.4
pkgrel=4
pkgdesc="Multiprecision rootfinder for complex roots of univariate polynomials"
url="http://numpi.dm.unipi.it/software/mpsolve"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmp' 'mpfr')
optdepends=('cython: Python bindings'
            'gtk3: Graphical debugger'
            'octave: Octave bindings'
            'qt4: Graphical interface xmpsolve')
source=("http://numpi.dm.unipi.it/_media/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('c6ea3774bbcb50865f65426761e398861bc448697c563bcd46e551c81c4f70ad')

build () {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-debug-build
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
