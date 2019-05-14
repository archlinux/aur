# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-stdio
pkgver=0.12.0
pkgrel=1
pkgdesc="Standard IO library for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/stdio'
license=('MIT')
depends=('ocaml' 'ocaml-base')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/stdio-v${pkgver}.tar.gz")
sha512sums=('53a8cef84964a2c8c47d5f0572897079cbc5c4983a923f069c6d0ca4558d1c87662eb13b630501815bc2448772312b93735c70813638a786f5213a09b63e03e8')

build() {
  cd "${srcdir}/stdio-v${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/stdio-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
