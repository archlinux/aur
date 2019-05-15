# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_inline_test
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Syntax extension for writing in-line tests in ocaml code"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_inline_test"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_inline_test-v${pkgver}.tar.gz")
sha512sums=('136555310442e479b676167d44a6dffb6f56517359165fe64778e863fd58021524a2fcd1d1246cd705fab62e3e510c60afcb20a574ac43687c86b7bbd990936d')

build() {
  cd "${srcdir}/ppx_inline_test-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_inline_test-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
