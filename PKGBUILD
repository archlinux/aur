# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_bench
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Syntax extension for writing in-line benchmarks in ocaml code"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_bench"
license=('Apache')
depends=('ocaml' 'ocaml-ppx_inline_test' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_bench-v${pkgver}.tar.gz")
md5sums=('a1565e9aa8e341f33e2e3dd712c889c8')

build() {
  cd "${srcdir}/ppx_bench-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_bench-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
