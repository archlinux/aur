# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-typerep
pkgver=112.35.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="A library for runtime types."
url="https://github.com/janestreet/typerep"
depends=('ocaml' 'ocaml-bin_prot' 'camlp4' 'ocaml-sexplib' 'ocaml-type_conv')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('aeb10c36678c4bc9a5942affaf3eab79')

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
