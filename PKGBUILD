# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_bin_prot
pkgver=113.33.03
pkgrel=1
pkgdesc="Generation of bin_prot readers and writers from types"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_bin_prot"
license=('Apache')
depends=('ocaml' 'ocaml-bin_prot' 'ocaml-ppx_core' 'ocaml-ppx_driver' 'ocaml-ppx_here' 'ocaml-ppx_tools' 'ocaml-ppx_type_conv')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch")
md5sums=('b3ef749c641056781dd2b861e72c7692'
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
