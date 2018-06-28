# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_js_style
pkgver=0.11.0
pkgrel=1
pkgdesc="Code style checker for Jane Street Packages"
arch=('x86_64')
url='https://github.com/janestreet/ppx_js_style'
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-octavius' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_js_style-v${pkgver}.tar.gz")
md5sums=('0994a7ecf0468f13fcac660413afafad')

build() {
  cd "${srcdir}/ppx_js_style-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/ppx_js_style-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
