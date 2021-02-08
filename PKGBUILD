# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=mpsolve
pkgver=3.2.1
pkgrel=2
pkgdesc="Multiprecision rootfinder for complex roots of univariate polynomials"
url="http://numpi.dm.unipi.it/software/mpsolve"
arch=('x86_64')
license=('GPL')
depends=('gmp' 'mpfr')
makedepends=('gcc-fortran')
optdepends=('cython: Python bindings'
            'doxygen: documentation (optional build-time dependency)'
            'gtk3: Graphical debugger'
            'qt5-base: Graphical interface xmpsolve')
options=(!libtool)
source=("http://numpi.dm.unipi.it/_media/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('45b22f6b04544b9eda2457eec58580d892c7e00824ebd2d6e31fe24cdd763804')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-debug --disable-examples
  make
}

check () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  if [ -e doc/html ]; then
    cd doc/html
    find . -type f -exec install -D -m644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
  fi
}
