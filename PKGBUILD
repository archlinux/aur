# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-bin_prot
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="A binary protocol generator"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/bin_prot"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_compare' 'ocaml-ppx_custom_printf' 'ocaml-ppx_fields_conv' 'ocaml-ppx_sexp_conv' 'ocaml-ppx_variants_conv')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/bin_prot-v${pkgver}.tar.gz")
sha512sums=('e2a35ca27f80c8a79a75017e30e277489a5f64716764da02b2de21500ba6709a440113bc6d33d07db9dcf81f02bd62670b9b310e36c9807e818d8e03e7f79300')

build() {
  cd "${srcdir}/bin_prot-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/bin_prot-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
