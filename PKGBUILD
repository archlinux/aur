# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-pa_structural_sexp
pkgver=113.00.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Industrial strength alternative to OCaml's standard library"
url="https://github.com/janestreet/core"
depends=('ocaml' 'camlp4' 'ocaml-sexplib' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('288c81277d521d938a46514b8e3fb623')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  ./configure --prefix /usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install
}
