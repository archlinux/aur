# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-migrate-parsetree
pkgver=1.3.1
pkgrel=1
pkgdesc="Convert OCaml parsetrees between different versions"
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/ocaml-ppx/ocaml-migrate-parsetree"
depends=('ocaml' 'ocaml-result' 'ocaml-ppx_derivers')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tbz")
sha512sums=('7da86f9596dd1439990a6f087fdeba64a0f3ce2634473be4cca92ecc02b6fcd97917956890fbe35b3cba5a126d007afec6ede1e4afd0a5218c89fd6079ad4182')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
