# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-re
pkgver=1.7.3
pkgrel=1
pkgdesc="Pure OCaml regular expressions, with support for Perl and POSIX-style strings"
arch=('i686' 'x86_64')
url="https://github.com/ocaml/ocaml-re"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://github.com/ocaml/ocaml-re/archive/${pkgver}.tar.gz")
sha256sums=('ea55060a1c556e3ceea4837af534567b09b7f15656281dadf8911aad6712f6c5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
