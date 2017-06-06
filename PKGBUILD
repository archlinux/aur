# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-herelib
pkgver=112.35.00
pkgrel=1
pkgdesc="OCaml syntax extension for inserting the current location"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/herelib"
license=('Apache')
depends=('ocaml' 'camlp4')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
md5sums=('b534bc00f643b664135346e6b8d69da0')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "$OCAMLFIND_DESTDIR"
  DESTDIR="${pkgdir}" \
    OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
    make install
}
