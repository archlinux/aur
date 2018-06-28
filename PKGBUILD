# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-typerep
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="A library for runtime types."
arch=('i686' 'x86_64')
url="https://github.com/janestreet/typerep"
license=('Apache')
depends=('ocaml' 'ocaml-base')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/typerep-v${pkgver}.tar.gz")
md5sums=('9d7500376ac660c1427137310fabe9da')

build() {
  cd "${srcdir}/typerep-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/typerep-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
