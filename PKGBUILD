# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-re
pkgver=1.8.0
pkgrel=1
pkgdesc="Pure OCaml regular expressions, with support for Perl and POSIX-style strings"
arch=('i686' 'x86_64')
url="https://github.com/ocaml/ocaml-re"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'ocaml-seq')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml/ocaml-re/releases/download/${pkgver}/re-${pkgver}.tbz")
sha512sums=('368c43d115b45c80c72770d2a61952f2614f4e4d1fc2a6b63691edda58b3eceac12f69f437b326cdf91b20ee62ce0e25ed3e89909e9e3c79ab56640691772085')

build() {
  cd "${srcdir}/re-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/re-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
