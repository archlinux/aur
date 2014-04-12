# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Chris Mann <cshclm at gmail dot com>

pkgname=unrar-free
pkgver=20140412
pkgrel=1
pkgdesc="Free utility to extract files from RAR archives."
url="http://gna.org/projects/unrar/"
arch=('i686' 'x86_64')
depends=("glibc")
makedepends=("cvs")
license=('GPL')

_cvsroot=":pserver:anonymous@cvs.gna.org:/cvs"
_cvsmod="unrar"

build() {
  cd "${srcdir}"

  unset CVS_RSH

  if [ -d "${_cvsmod}/CVS" ]; then
    cd "${_cvsmod}"
    cvs -q update -dA
  else
    cvs -q -z3 -d${_cvsroot}/${_cvsmod} co ${_cvsmod}
    cd "${_cvsmod}"
  fi

  ./configure --prefix=/usr --program-suffix=-free
  make
}

package() {
  cd "${srcdir}/${_cvsmod}"
  make DESTDIR="${pkgdir}" install || return 1
}
