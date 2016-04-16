# Contributor: Paolo Herms
# Contributor: kaptoxic

pkgname=why3-git
pkgver=0.72.r3740.g406e7f0
pkgrel=2
pkgdesc="The next generation of the former software verification platform Why"
arch=(x86_64 i686)
url="http://why3.gforge.inria.fr/"
license=('GPL')
depends=('gtksourceview2' 'sqlite')
makedepends=('ocaml' 'ocaml-sqlite3' 'lablgtk2' 'ocaml-menhir' 'git' 'autoconf')
conflicts=('why3')
source=('why3::git+https://scm.gforge.inria.fr/anonscm/git/why3/why3.git')
md5sums=('SKIP')

_gitroot="https://scm.gforge.inria.fr/anonscm/git/why3/why3.git"
_gitname="why3"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g' | sed 's#debian/##'
}

build() {
  cd "${srcdir}/${_gitname}"
  autoconf
  ./configure --prefix=/usr --disable-pvs-libs
  make clean
  make all # src/why3.cma
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir" OCAMLLIB="$pkgdir"/usr/lib/ocaml install install-lib
}
md5sums=('SKIP')
