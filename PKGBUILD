# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=ocaml-psmt2-frontend-git
_pkgname=psmt2-frontend
pkgver=r22.bb35b53
pkgrel=1
pkgdesc="A simple parser and type-checker for polomorphic extension of the SMT-LIB 2 language"
arch=('i686' 'x86_64')
url="https://github.com/OCamlPro-Coquera/psmt2-frontend"
license=('Apache2')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-menhir')
options=(!strip staticlibs)
provides=('ocaml-psmt2-frontend')
conflicts=('ocaml-psmt2-frontend')
source=("git+https://github.com/OCamlPro-Coquera/psmt2-frontend.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/lib/ocaml/psmt2-frontend"
  make DESTDIR="$pkgdir/usr" LIBDIR="$pkgdir/usr/lib/ocaml" install
}

