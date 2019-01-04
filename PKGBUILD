# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_kernel
pkgver=0.11.1
pkgrel=1
epoch=1
pkgdesc="Industrial strength alternative to OCaml's standard library (system-independent part)"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core_kernel"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-bin_prot' 'ocaml-configurator' 'ocaml-fieldslib' 'ocaml-jane-street-headers' 'ocaml-ppx_assert' 'ocaml-ppx_base' 'ocaml-ppx_hash' 'ocaml-ppx_inline_test' 'ocaml-ppx_jane' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_sexp_message' 'ocaml-sexplib' 'ocaml-splittable_random' 'ocaml-stdio' 'ocaml-typerep' 'ocaml-variantslib' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/core_kernel/archive/v${pkgver}.tar.gz")
sha512sums=('0b40af0f450f281ed6a49adaf8d0c8435ea86b3891bb760336097a4f4c80d1c184c27d20c40eef3b07757691d97afe9ced10f5fe5c9e691fd4dd2afa1ca4bd4e')

build() {
  cd "${srcdir}/core_kernel-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/core_kernel-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
