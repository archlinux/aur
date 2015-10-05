# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-comparelib
pkgver=113.00.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="OCaml syntax extension for deriving \"compare\" functions automatically"
url="https://github.com/janestreet/comparelib"
depends=('ocaml' 'camlp4' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('bdb4f44831e0ba7325a9d0ec2540fa48')

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
