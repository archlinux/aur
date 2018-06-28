# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_fields_conv
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Generation of accessor and iteration functions for ocaml records"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_fields_conv"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-fieldslib' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_fields_conv-v${pkgver}.tar.gz")
md5sums=('72f207c23d65f7f3eaabcc92e33ccdab')

build() {
  cd "${srcdir}/ppx_fields_conv-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_fields_conv-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
