# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-variantslib
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="OCaml variants as first class values"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/variantslib"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/variantslib-v${pkgver}.tar.gz")
md5sums=('3031317975df165cc3154578680eddfb')

build() {
  cd "${srcdir}/variantslib-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/variantslib-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
