# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_expect
pkgver=0.11.1
pkgrel=1
epoch=1
pkgdesc="Cram like framework for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_expect"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_assert' 'ocaml-ppx_compare' 'ocaml-ppx_custom_printf' 'ocaml-ppx_fields_conv' 'ocaml-ppx_here' 'ocaml-ppx_inline_test' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_variants_conv' 'ocaml-stdio' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-re')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://github.com/janestreet/ppx_expect/releases/download/v${pkgver}/ppx_expect-v${pkgver}.tbz")
sha512sums=('f94e88d15ab0480995955471fe24812674fe19e7519094641a354672cd0a8d0c25069210943acecc0bfc5d4da7f6793a0e263ddc7a6dddc85bb98095243f70fb')

build() {
  cd "${srcdir}/ppx_expect-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_expect-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
