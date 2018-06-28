# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_optcomp
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="Optional compilation for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_optcomp"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-stdio' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_optcomp-v${pkgver}.tar.gz")
md5sums=('396d6bac4ed5652d7be146756613c67e')

build() {
  cd "${srcdir}/ppx_optcomp-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_optcomp-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
