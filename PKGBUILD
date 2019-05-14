# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-variantslib
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="OCaml variants as first class values"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/variantslib"
license=('MIT')
depends=('ocaml' 'ocaml-base')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/variantslib-v${pkgver}.tar.gz")
sha512sums=('a5e69349ec05ccd0d0d34e9c11817d1d4defea95cc51db4eaaa3d280672976f6f9cd70abfc5fe082b5487cab0c272d4776e1801b78b4a5f5765cf1cdda16ccb2')

build() {
  cd "${srcdir}/variantslib-v${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/variantslib-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
