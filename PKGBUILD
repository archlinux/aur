# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_base
pkgver=0.11.0
pkgrel=1
pkgdesc="Base set of ppx rewriters"
arch=('x86_64')
url='https://github.com/janestreet/ppx_base'
license=('Apache')
depends=('ocaml' 'ocaml-ppx_compare' 'ocaml-ppx_enumerate' 'ocaml-ppx_hash' 'ocaml-ppx_js_style' 'ocaml-ppx_sexp_conv' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_base-v${pkgver}.tar.gz")
md5sums=('a0020fbf308592aa71932bea8135fac5')

build() {
  cd "${srcdir}/ppx_base-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/ppx_base-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
