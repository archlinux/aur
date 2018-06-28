# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-fieldslib
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="OCaml record fields as first class values "
arch=('i686' 'x86_64')
url="https://github.com/janestreet/fieldslib"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/fieldslib-v${pkgver}.tar.gz")
md5sums=('a42506b460a1dc47fb65a37d875211ae')

build() {
  cd "${srcdir}/fieldslib-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/fieldslib-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
