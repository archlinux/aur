# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-migrate-parsetree
pkgver=1.3.0
pkgrel=1
pkgdesc="Convert OCaml parsetrees between different versions"
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/ocaml-ppx/ocaml-migrate-parsetree"
depends=('ocaml' 'ocaml-result' 'ocaml-ppx_derivers')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml-ppx/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tbz")
sha512sums=('95a12f4e9e257395aeb5024f3acf4f8e419f6df8d94e611c3660a139254252aa5e462394a5ff91c2b238351bed946e0b5aee05f22e0e2e3350fb476ab3b8b510')

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
