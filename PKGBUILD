# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_here
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Expands [%here] into its location"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_here"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_here-v${pkgver}.tar.gz")
md5sums=('479c9cd5f6ef90c2df9f01eab9d6c91d')

build() {
  cd "${srcdir}/ppx_here-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_here-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
