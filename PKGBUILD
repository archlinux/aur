# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_kernel
pkgver=0.11.0
pkgrel=2
epoch=1
pkgdesc="Industrial strength alternative to OCaml's standard library (system-independent part)"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core_kernel"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-bin_prot' 'ocaml-configurator' 'ocaml-fieldslib' 'ocaml-jane-street-headers' 'ocaml-ppx_assert' 'ocaml-ppx_base' 'ocaml-ppx_hash' 'ocaml-ppx_inline_test' 'ocaml-ppx_jane' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_sexp_message' 'ocaml-sexplib' 'ocaml-splittable_random' 'ocaml-stdio' 'ocaml-typerep' 'ocaml-variantslib' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/core_kernel-v${pkgver}.tar.gz")
md5sums=('ac08234f5799eba5009d04443ab35e8c')

build() {
  cd "${srcdir}/core_kernel-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/core_kernel-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
