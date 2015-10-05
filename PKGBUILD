# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-bin_prot
pkgver=113.00.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="A binary protocol generator"
url="https://github.com/janestreet/bin_prot"
depends=('ocaml' 'camlp4' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz")
options=('!strip')
md5sums=('941c9e86e409b74eeeea771a78961157')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "$OCAMLFIND_DESTDIR/stublibs"
  DESTDIR="${pkgdir}" \
    OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
    make install
}
