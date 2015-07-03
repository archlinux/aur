# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-variantslib
pkgver=109.15.03
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="OCaml variants as first class values"
url="https://github.com/janestreet/variantslib"
depends=('ocaml' 'camlp4' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+").00/individual/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('eb60576d24114a38f2491ecab782bd3e')

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
