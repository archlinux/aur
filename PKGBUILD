# Maintainer: Yen Chi Hsuan < yan12125 at gmail dot com >
# Contributor: lesebas < sebdeligny at gmail dot com>

pkgname=ocaml-extlib
pkgver=1.7.2
pkgrel=1
pkgdesc="Extends the OCaml standard library"
arch=('i686' 'x86_64')
url="https://github.com/ygrek/ocaml-extlib"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'cppo')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/ygrek/ocaml-extlib/archive/${pkgver}.tar.gz")
options=('staticlibs')
sha256sums=('00fa8ad0990e75b94902ef013ba5ec9cc51532663e1e3059ebe7a850576eb90a')

build() {
  cd ocaml-extlib-${pkgver}

  make build
  make doc
}

package () {
  _DOCDIR="${pkgdir}/usr/share/doc/ocaml-extlib"

  cd ocaml-extlib-${pkgver}

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -Ddm755 "${OCAMLFIND_DESTDIR}"
  make install

  # Install doc
  install -Ddm755 "$_DOCDIR"
  cp -dr --no-preserve=ownership src/doc/* "$_DOCDIR/"
}
