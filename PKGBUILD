# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_let
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Monadic let-bindings"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_let"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_let-v${pkgver}.tar.gz")
md5sums=('40d1798d7724816c65eb5cdabd20f150')

build() {
  cd "${srcdir}/ppx_let-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_let-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
