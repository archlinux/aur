# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-typerex
pkgver=1.0.1
pkgrel=2
pkgdesc="TypeRex is a powerful development environment for OCaml."
arch=("i686" "x86_64")
url=("http://www.typerex.org/")
license=("GPLv3")
depends=("emacs" "ocaml>=3.11.2")
source=("http://www.typerex.org/pub/typerex-${pkgver}.tar.gz")
md5sums=('7a9d91b64041231d7a0fc9cf462f0327')

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
