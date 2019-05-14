# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_fields_conv
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Generation of accessor and iteration functions for ocaml records"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_fields_conv"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-fieldslib' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_fields_conv-v${pkgver}.tar.gz")
sha512sums=('0574587461ab4334e3ab970224390544b9f022739b518562faedeb89751839667082adef3aaeac60f8530ae5670cb85a737ca4caec0080fbd945c22caa1dfdad')

build() {
  cd "${srcdir}/ppx_fields_conv-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_fields_conv-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
