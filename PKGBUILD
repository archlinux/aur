# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-migrate-parsetree
pkgver=1.4.0
pkgrel=1
pkgdesc="Convert OCaml parsetrees between different versions"
arch=('i686' 'x86_64')
license=('custom:LGPL2.1 with linking exception')
url="https://github.com/ocaml-ppx/ocaml-migrate-parsetree"
depends=('ocaml' 'ocaml-result' 'ocaml-ppx_derivers')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tbz")
sha512sums=('61ee91d2d146cc2d2ff2d5dc4ef5dea4dc4d3c8dbd8b4c9586d64b6ad7302327ab35547aa0a5b0103c3f07b66b13d416a1bee6d4d117293cd3cabe44113ec6d4')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  dune build --profile release
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
