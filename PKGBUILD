# Maintainer: Yen Chi Hsuan < yan12125 at gmail dot com >
# Contributor: lesebas < sebdeligny at gmail dot com>

pkgname=ocaml-extlib
pkgver=1.8.0
pkgrel=2
pkgdesc="Extends the OCaml standard library"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/ygrek/ocaml-extlib"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'cppo')
source=(
  "$pkgname-$pkgver.tar.gz"::"https://github.com/ygrek/ocaml-extlib/archive/${pkgver}.tar.gz"
  "0001-Fix-and-improve-documentation-77.patch"
)
options=('staticlibs')
sha256sums=('6d7ab4ff5bbbc228496ba0311e1899a8ca1096699e438d01beb2c67ae1135c5d'
            '2e27fb7f3a4b5c5ca666aafd514ac926fbcd8ed5eb52aaa54eea07917f82c187')

prepare() {
  cd ocaml-extlib-${pkgver}

  patch -p1 < "${srcdir}/0001-Fix-and-improve-documentation-77.patch"
}

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
