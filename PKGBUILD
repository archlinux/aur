# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_type_conv
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Support Library for type-driven code generators"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_type_conv"
license=('Apache')
depends=('ocaml' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_type_conv-v${pkgver}.tar.gz")
md5sums=('34a6339cf7259e114b2946c615fed9b8')

build() {
  cd "${srcdir}/ppx_type_conv-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_type_conv-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
