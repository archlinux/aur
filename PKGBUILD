# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-stdio
pkgver=0.11.0
pkgrel=1
pkgdesc="Standard IO library for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/stdio'
license=('Apache')
depends=('ocaml' 'ocaml-base')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/stdio-v${pkgver}.tar.gz")
md5sums=('2db42ee38c91b3ff7126c2634c407b99')

build() {
  cd "${srcdir}/stdio-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/stdio-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
