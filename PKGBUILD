# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-pa_bench
pkgver=112.06.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Syntax extension for inline benchmarks"
url="https://github.com/janestreet/pa_bench"
depends=('ocaml' 'ocaml-pa_ounit' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/${pkgver}/individual/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('c270ccea47f83bf2a9206d1fa502c02e')

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
