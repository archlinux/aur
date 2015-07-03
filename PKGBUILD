# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-textutils
pkgver=112.17.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Text output utilities"
url="https://github.com/janestreet/textutils"
depends=('ocaml' 'camlp4' 'ocaml-core' 'ocaml-pa_ounit' 'ocaml-sexplib')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('170dc582e4c6e80d4c9e8c7367adbfa2')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix /usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "$OCAMLFIND_DESTDIR"
  make install
}
