# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_custom_printf
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Printf-style format-strings for user-defined string conversion"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_custom_printf"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_sexp_conv' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_custom_printf-v${pkgver}.tar.gz")
sha512sums=('87b61a2da62708a54f559a70d2f0bea1d6066a23a44735f5ae13a04918537054bcc971c6cd27a5f0c5f795d4679ee8fb19e9f19318b27e2ce2dfc1d30e40109e')

build() {
  cd "${srcdir}/ppx_custom_printf-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_custom_printf-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
