# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname="ocaml-utop"
pkgver=2.1.0
pkgrel=1
pkgdesc='A toplevel for OCaml that supports completion, colors, and parenthesis matching'
arch=('i686' 'x86_64')
url='https://github.com/diml/utop'
license=('BSD')
depends=('ocaml' 'ocaml-findlib' 'ocaml-lambda-term' 'ocaml-lwt' 'ocaml-camomile' 'ocaml-react')
makedepends=('dune' 'cppo')
options=('!strip')
source=("https://github.com/diml/utop/releases/download/${pkgver}/utop-${pkgver}.tbz")
md5sums=('6c63a321379069a1b9ecb7899f80087b')

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
