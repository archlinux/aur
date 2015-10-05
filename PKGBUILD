# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-custom_printf
pkgver=113.00.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Extension for printf format strings"
url="https://github.com/janestreet/custom_printf"
depends=('ocaml' 'camlp4' 'ocaml-pa_ounit' 'ocaml-sexplib' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('132de32cc7d6ad6526faf92f904cfad1')

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
