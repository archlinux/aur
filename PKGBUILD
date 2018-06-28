# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_core
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Standard library for ppx rewriters"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_core"
license=('Apache')
depends=('ocaml' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_core-v${pkgver}.tar.gz")
md5sums=('f39ed11235935a4ee31df0b86940e774')

build() {
  cd "${srcdir}/ppx_core-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_core-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
