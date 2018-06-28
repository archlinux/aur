# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-base
pkgver=0.11.0
pkgrel=2
pkgdesc="Full standard library replacement for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/base'
license=('Apache')
depends=('ocaml' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/base-v${pkgver}.tar.gz")
md5sums=('787aaa04b25eca106ebb9380a32bad66')

build() {
  cd "${srcdir}/base-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/base-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/lib/ocaml/stubslibs" "${pkgdir}/usr/lib/ocaml/stublibs" # bug in opam
}
