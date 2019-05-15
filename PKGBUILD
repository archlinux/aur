# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_assert
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Assert-like extension nodes that raise useful errors on failure"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_assert"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_compare' 'ocaml-ppx_here' 'ocaml-ppx_sexp_conv' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_assert-v${pkgver}.tar.gz")
sha512sums=('4ebc62572f945ebe583c7392120b38cd723b292162dbc7f20293fab8877c6139a9cad7d3439204ded3f013cc5a53137594b4e1c11ad56d8a089459f739a71ed9')

build() {
  cd "${srcdir}/ppx_assert-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_assert-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
