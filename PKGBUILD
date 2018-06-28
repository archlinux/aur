# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_sexp_message
pkgver=0.11.0
pkgrel=1
pkgdesc="A ppx rewriter for easy construction of s-expressions"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_sexp_message"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_here' 'ocaml-ppx_sexp_conv' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_sexp_message-v${pkgver}.tar.gz")
md5sums=('2cec96bcf6f7c54ba79fe39fc9fc4d98')

build() {
  cd "${srcdir}/ppx_sexp_message-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_sexp_message-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
