# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-typerex
pkgver=1.99.7b
_pkgver=1.99.7-beta
pkgrel=2
pkgdesc="TypeRex is a powerful development environment for OCaml."
arch=("i686" "x86_64")
url="http://www.typerex.org/"
license=("GPLv3")
depends=("emacs" "ocaml>=3.11.2")
source=("https://www.typerex.org/pub/typerex/typerex.${_pkgver}.tar.gz")
sha256sums=('1a11a2c9ee1663cf91b819eb638549209efa618d0a0b78e2827a8bdd405b2443')

build() {
  cd "$srcdir/${pkgname/ocaml-/}-${pkgver}"

  ./configure --prefix="${pkgdir}/usr"
  make
  sed "s|${pkgdir}[/]*|/|g" -i emacs.append
}

package() {
  cd "$srcdir/${pkgname/ocaml-/}-${pkgver}"
  extra="${pkgdir}/usr/share"

  make install
  install -d "${extra}/"{licenses,,doc}"/${pkgname}"
  install -m 0644 -t "${extra}/licenses/${pkgname}" LICENSE*
  install -m 0644 -t "${extra}/${pkgname}"          emacs.append
  install -m 0644 -t "${extra}/doc/${pkgname}"      docs/user-manual/*.pdf
}
