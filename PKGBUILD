# Maintainer: j_klee <jannes.klee@gmail.com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: aphirst <adam@aphirst.karoo.co.uk>

pkgname=fgsl-git
pkgver=1.3.0gsl2.6
pkgrel=1
pkgdesc="A Fortran interface to the GNU Scientific Library"
arch=('i686' 'x86_64')
url="https://doku.lrz.de/display/PUBLIC/FGSL+-+A+Fortran+interface+to+the+GNU+Scientific+Library"
license=('GPL')
depends=("gsl>=2.6" 'gcc-fortran' 'automake' 'autoconf' 'libtool')
# the original source for FGSL is not updated for years and the fix for GSL2.6 not merged
# to the main repository
# source=("${pkgname}::git+https://github.com/reinh-bader/fgsl")
source=("${pkgname}::git+https://github.com/tschoonj/fgsl#branch=remove-gsl_spmatrix_compare_idx")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
