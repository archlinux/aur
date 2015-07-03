# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-enumerate
pkgver=111.08.00
pkgrel=2
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Text output utilities"
url="https://github.com/janestreet/enumerate"
depends=('ocaml' 'camlp4' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/${pkgver}/individual/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('2cb0ad1f4a7fc4c9fe1bf6d294be10ce')

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
