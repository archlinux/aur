# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-sloppycell
pkgver=20110614
pkgrel=1
pkgdesc="Software environment for simulation and analysis of biomolecular networks"
arch=('i686' 'x86_64')
url="http://sloppycell.sourceforge.net/"
license=('BSD')
depends=('python2-scipy' 'python2-numpy' 'lapack')
makedepends=('cvs' 'gcc-fortran')

_cvsroot=":pserver:anonymous@sloppycell.cvs.sourceforge.net:/cvsroot"
_cvsmod="sloppycell"
_cvsMod="SloppyCell"

build() {
  cd "$srcdir"
  if [ -d ${_cvsMod}/CVS ]; then
    cd ${_cvsMod}
    cvs -q update -dA
  else
    cvs -q -z3 -d${_cvsroot}/${_cvsmod} co ${_cvsMod}
    cd ${_cvsMod}
    sed -i "/daskr =/s|$| extra_link_args='-Wl,--defsym,main=main',|" setup.py
  fi
  python2 setup.py build
}

package() {
  cd "$srcdir/$_cvsMod"
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
}

