# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-typerep
pkgver=113.24.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="A library for runtime types."
url="https://github.com/janestreet/typerep"
depends=('ocaml' 'ocaml-bin_prot' 'camlp4' 'ocaml-sexplib' 'ocaml-type_conv')
makedepends=('ocaml-findlib' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('2f7d73c4f7be1d1d842c774ce90c27c6'
         '7f0a951f1ac87385272ea7a6dd58762a')

prepare() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  patch -Np1 < "${srcdir}/libdir.patch"
}

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  make install LIBDIR="${pkgdir}$(ocamlc -where)"
}
