# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_inline_test
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Syntax extension for writing in-line tests in ocaml code"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_inline_test"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_inline_test-v${pkgver}.tar.gz")
md5sums=('1f2e014332373638696d8893d87f4682')

build() {
  cd "${srcdir}/ppx_inline_test-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_inline_test-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/lib/ocaml/stubslibs" "${pkgdir}/usr/lib/ocaml/stublibs" # bug in opam
}
