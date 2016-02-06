# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core
pkgver=113.24.00
pkgrel=1
license=('Apache')
arch=('i686' 'x86_64')
pkgdesc="Industrial strength alternative to OCaml's standard library"
url="https://github.com/janestreet/core"
depends=('ocaml' 'ocaml-bin_prot' 'ocaml-core_kernel' 'ocaml-fieldslib' 'ocaml-ppx_assert' 'ocaml-ppx_bench' 'ocaml-ppx_driver' 'ocaml-ppx_expect' 'ocaml-ppx_inline_test' 'ocaml-ppx_jane' 'ocaml-sexplib' 'ocaml-typerep' 'ocaml-variantslib')
optdepends=('ocaml-utop: for coretop support')
makedepends=('ocaml-findlib' 'opam')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('90aa987056d18d8be2600bc1dd0d71de'
         '7f0a951f1ac87385272ea7a6dd58762a')

prepare() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  patch -Np1 < "${srcdir}/libdir.patch"
}

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  ./configure --prefix /usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"
  
  make install PREFIX="${pkgdir}/usr" LIBDIR="${pkgdir}$(ocamlc -where)"
}
