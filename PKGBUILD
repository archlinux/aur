# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_assert
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Assert-like extension nodes that raise useful errors on failure"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_assert"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_compare' 'ocaml-ppx_here' 'ocaml-ppx_sexp_conv' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_assert-v${pkgver}.tar.gz")
md5sums=('0b3aed19391e9a23217a5abf022dfe10')

build() {
  cd "${srcdir}/ppx_assert-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_assert-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
