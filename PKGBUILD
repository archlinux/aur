# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-fieldslib
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="OCaml record fields as first class values "
arch=('i686' 'x86_64')
url="https://github.com/janestreet/fieldslib"
license=('MIT')
depends=('ocaml' 'ocaml-base')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/fieldslib-v${pkgver}.tar.gz")
sha512sums=('c103ea6d35213549e75c0cc4ade2828a5ff5bec56edb6a83ffbdcdeff57a65ea117c33432cd8e8b9cfdfe70d26b8d4e22b4717f401c50a4e8a1eb80c78d6b2b7')

build() {
  cd "${srcdir}/fieldslib-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/fieldslib-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
