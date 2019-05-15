# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_bench
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Syntax extension for writing in-line benchmarks in ocaml code"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_bench"
license=('MIT')
depends=('ocaml' 'ocaml-ppx_inline_test' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_bench-v${pkgver}.tar.gz")
sha512sums=('0f89c0b17d873befc7f613bb3b09ec1dba5af046a918b1c64dd3e09fdc83e3e12f455103e330744e74f7ab6b122fe6f14d42d625dfc7fcaec48ab7821086c13e')

build() {
  cd "${srcdir}/ppx_bench-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_bench-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
