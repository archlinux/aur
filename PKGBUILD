# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_sexp_value
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="A ppx rewriter that simplifies building s-expressions from ocaml values"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_sexp_value"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_here' 'ocaml-ppx_sexp_conv' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_sexp_value-v${pkgver}.tar.gz")
md5sums=('28375d3b4bf5cda71b9260d20e5c3d34')

build() {
  cd "${srcdir}/ppx_sexp_value-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_sexp_value-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
