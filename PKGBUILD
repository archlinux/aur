# Maintainer: William J. Bowman <aur@williamjbowman.com>

pkgname=autosubst-devel
_pkgname=autosubst
pkgver=1.6
pkgrel=2
pkgdesc="Automation for de Bruijn syntax and substition in Coq."
url="https://github.com/tebbi/autosubst"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq')
makedepends=('camlp5-transitional>=6.12' 'git')
source=("autosubst::git+https://github.com/tebbi/${_pkgname}#branch=coq86-devel")
sha256sums=('SKIP')
sha512sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(grep '^VERSION=' src/Makefile.ProjectInfo | cut -d = -f 2)" "$(git rev-parse --short HEAD)"
 
}

build() {
  cd $srcdir/${_pkgname}

  make
}

package(){
  cd $srcdir/${_pkgname}
  make DESTDIR=$pkgdir 'COQLIB:=$(DESTDIR)/$(shell coqtop -where)/' install
}
