# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_compare
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Generation of comparison functions from types"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_compare"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_compare/archive/v${pkgver}.tar.gz")
sha512sums=('435f805ba19fa9fc7451cf647ad17aba6da45fd03abf35cebe9a4fd07da8a90e303b2f92e7ce4855d0e84f9c7a62ef9249b714e8434053b7cbfba9b15430f27f')

build() {
  cd "${srcdir}/ppx_compare-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_compare-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
