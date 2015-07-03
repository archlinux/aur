# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-typerep
pkgver=112.24.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="A library for runtime types."
url="https://github.com/janestreet/typerep"
depends=('ocaml' 'ocaml-bin_prot' 'camlp4' 'ocaml-sexplib' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")$([[ $(echo ${pkgver} | grep -Po "[0-9]+$") != "00" ]] && echo ".$(echo ${pkgver} | grep -Po "[0-9]+$")").tar.gz")
options=('!strip')
md5sums=('0697290a8f350482ac0deef2f332be2c')

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
