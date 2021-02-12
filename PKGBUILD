# Maintainer: Yen Chi Hsuan < yan12125 at gmail dot com >
# Contributor: lesebas < sebdeligny at gmail dot com>

pkgname=ocaml-extlib
pkgver=1.7.8
pkgrel=1
pkgdesc="Extends the OCaml standard library"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/ygrek/ocaml-extlib"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'cppo')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/ygrek/ocaml-extlib/archive/${pkgver}.tar.gz")
options=('staticlibs')
sha256sums=('9e18c4f807afcef5e5d2050c7b4e375ebe7ee989820eff45d79f29f7195d26d8')

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
