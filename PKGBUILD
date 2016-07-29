# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-fieldslib
pkgver=113.33.03
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="OCaml record fields as first class values "
url="https://github.com/janestreet/fieldslib"
depends=('ocaml')
makedepends=('ocaml-js-build-tools' 'ocaml-findlib' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('20566b9efc8dfc6b7d769ffc060afafc'
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

  make install PREFIX="${pkgdir}/usr" LIBDIR="${pkgdir}$(ocamlc -where)"
}
