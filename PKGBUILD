# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_jane
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Standard Jane Street ppx rewriters"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_jane"
license=('Apache')
depends=('ocaml' 'ocaml-ppx_assert' 'ocaml-ppx_base' 'ocaml-ppx_bench' 'ocaml-ppx_bin_prot' 'ocaml-ppx_custom_printf' 'ocaml-ppx_expect' 'ocaml-ppx_fail' 'ocaml-ppx_fields_conv' 'ocaml-ppx_here' 'ocaml-ppx_inline_test' 'ocaml-ppx_let' 'ocaml-ppx_optcomp' 'ocaml-ppx_optional' 'ocaml-ppx_pipebang' 'ocaml-ppx_sexp_message' 'ocaml-ppx_sexp_value' 'ocaml-ppx_typerep_conv' 'ocaml-ppx_variants_conv' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_jane-v${pkgver}.tar.gz")
md5sums=('11da0871ae3841fb6710ec6471ce6b92')

build() {
  cd "${srcdir}/ppx_jane-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_jane-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
