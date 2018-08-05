# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_expect
pkgver=0.11.0
pkgrel=2
epoch=1
pkgdesc="Cram like framework for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_expect"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_assert' 'ocaml-ppx_compare' 'ocaml-ppx_custom_printf' 'ocaml-ppx_fields_conv' 'ocaml-ppx_here' 'ocaml-ppx_inline_test' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_variants_conv' 'ocaml-stdio' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-re')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_expect-v${pkgver}.tar.gz")
md5sums=('ee183ff3ca85954a84a54d32b8073546')

build() {
  cd "${srcdir}/ppx_expect-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_expect-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
