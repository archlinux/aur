# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core
pkgver=112.35.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Industrial strength alternative to OCaml's standard library"
url="https://github.com/janestreet/core"
depends=('ocaml' 'ocaml-bin_prot' 'camlp4' 'ocaml-comparelib' 'ocaml-core_kernel' 'ocaml-custom_printf' 'ocaml-enumerate' 'ocaml-fieldslib' 'ocaml-herelib' 'ocaml-pa_bench' 'ocaml-pa_ounit' 'ocaml-pa_structural_sexp' 'ocaml-pa_test' 'ocaml-pipebang' 'ocaml-sexplib' 'ocaml-variantslib')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('e98f85426fd8c886ad6b5fb7fb1eec42')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  ./configure --prefix /usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install
}
