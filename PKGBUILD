# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-pa_test
pkgver=112.24.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Quotation expander for assertions."
url="https://github.com/janestreet/pa_test"
depends=('ocaml' 'camlp4' 'ocaml-comparelib' 'ocaml-herelib' 'ocaml-sexplib' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")$([[ $(echo ${pkgver} | grep -Po "[0-9]+$") != "00" ]] && echo ".$(echo ${pkgver} | grep -Po "[0-9]+$")").tar.gz")
options=('!strip')
md5sums=('1b0e52b9f76a47258bba734577ee56e7')

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install DESTDIR="${pkgdir}"
}
