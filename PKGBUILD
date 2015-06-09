# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_kernel
pkgver=112.24.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Industrial strength alternative to OCaml's standard library (system-independent part)"
url="https://github.com/janestreet/core_kernel"
depends=('ocaml' 'ocaml-bin_prot' 'camlp4' 'ocaml-comparelib' 'ocaml-custom_printf' 'ocaml-enumerate' 'ocaml-fieldslib' 'ocaml-herelib' 'ocaml-pa_bench' 'ocaml-pa_ounit' 'ocaml-pa_test' 'ocaml-pipebang' 'ocaml-sexplib' 'ocaml-typerep' 'ocaml-variantslib')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")$([[ $(echo ${pkgver} | grep -Po "[0-9]+$") != "00" ]] && echo ".$(echo ${pkgver} | grep -Po "[0-9]+$")").tar.gz")
options=('!strip')
md5sums=('776c6560c005a355f6a801c0edf211f9')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix /usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p $OCAMLFIND_DESTDIR/stublibs
  make install
}
