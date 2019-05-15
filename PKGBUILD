# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_base
pkgver=0.12.0
pkgrel=1
pkgdesc="Base set of ppx rewriters"
arch=('x86_64')
url='https://github.com/janestreet/ppx_base'
license=('MIT')
depends=('ocaml' 'ocaml-ppx_compare' 'ocaml-ppx_enumerate' 'ocaml-ppx_hash' 'ocaml-ppx_js_style' 'ocaml-ppx_sexp_conv' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_base-v${pkgver}.tar.gz")
sha512sums=('8d9f4a7ddf70b8deb8a92344bf287322e567225343636198c8116158d12c7cb6bb2d0b562cec9cd81c84120431bfb00471d0f052c84b963e002d0552e0e323bd')

build() {
  cd "${srcdir}/ppx_base-v${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/ppx_base-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
