# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_fields_conv
pkgver=113.33.03
pkgrel=1
pkgdesc="Generation of accessor and iteration functions for ocaml records"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_fields_conv"
license=('Apache')
depends=('ocaml' 'ocaml-fieldslib' 'ocaml-ppx_core' 'ocaml-ppx_tools' 'ocaml-ppx_type_conv')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
md5sums=('5e86c8e11ff261dc85301fcf7236c8bf'
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
