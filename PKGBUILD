# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_driver
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Feature-full driver for OCaml AST transformers"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_driver"
license=('Apache')
depends=('ocaml' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_driver-v${pkgver}.tar.gz")
md5sums=('706cda8f743dd8b81aaa87f7261af252')

build() {
  cd "${srcdir}/ppx_driver-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_driver-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
