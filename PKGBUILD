# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-pprint
_oname=pprint
pkgver=20171003
pkgrel=1
pkgdesc="An OCaml adaptation of Wadler's and Leijen's prettier printer."
arch=('i686' 'x86_64')
url='http://gallium.inria.fr/~fpottier/pprint/doc/PPrint.OCaml.html'
license=('BSD')
makedepends=('ocamlbuild' 'ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
source=("http://gallium.inria.fr/~fpottier/${_oname}/${_oname}-${pkgver}.tar.gz")
sha256sums=('9d194e666248c9a8c6008e778310e4fb9be12c3023c9af9bc46aa298a7d6fc1b')

build() {
  cd "$srcdir/$_oname-$pkgver"
  make -C src
}

package() {
  cd "$srcdir/$_oname-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make -C src install
}
