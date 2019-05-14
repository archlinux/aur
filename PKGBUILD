# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_sexp_conv
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Generation of S-expression conversion functions from type definitions"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_sexp_conv"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-sexplib0' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_sexp_conv/archive/v${pkgver}.tar.gz")
sha512sums=('f6adca0cf1aa9edef034425c586749879f8dcdbd2375e5c77bfa57dba37b024d0fdaeea97009c10891d3d6dac7240da554350b47a22af9d2f9fbbf758d8426a0')

build() {
  cd "${srcdir}/ppx_sexp_conv-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_sexp_conv-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
