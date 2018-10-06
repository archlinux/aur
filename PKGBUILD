# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname="ocaml-utop"
pkgver=2.2.0
pkgrel=1
pkgdesc='A toplevel for OCaml that supports completion, colors, and parenthesis matching'
arch=('i686' 'x86_64')
url='https://github.com/diml/utop'
license=('BSD')
depends=('ocaml' 'ocaml-findlib' 'ocaml-lambda-term' 'ocaml-lwt' 'ocaml-camomile' 'ocaml-react')
makedepends=('dune' 'cppo')
options=('!strip')
source=("https://github.com/diml/utop/releases/download/${pkgver}/utop-${pkgver}.tbz")
sha512sums=('edacbd475c452de08e8d7c1697d0b624acc2f4854c200853664e1818ab9f9c26a3edc1c4d0a3b39bfc6f6be31440de6d45db8d342868a61fe36c4cbe4c7b5dab')

build() {
  cd "${srcdir}/utop-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/utop-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
