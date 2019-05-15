# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_hash
pkgver=0.12.0
pkgrel=1
pkgdesc="A ppx rewriter that generates hash functions from type expressions and definitions"
arch=('x86_64')
url='https://github.com/janestreet/ppx_hash'
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_compare' 'ocaml-ppx_sexp_conv' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_hash/archive/v${pkgver}.tar.gz")
sha512sums=('bc703cb88ec2ecfc3af8890bc231c3e93ae68caadb6917d2bc7b7f30ca210bfda559d94cd562d5ecaf8ac7178d9219499ffbdb1042d1c83d68646106546ef0ec')

build() {
  cd "${srcdir}/ppx_hash-${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/ppx_hash-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
