# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_kernel
pkgver=113.33.03
pkgrel=1
pkgdesc="Industrial strength alternative to OCaml's standard library (system-independent part)"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core_kernel"
license=('Apache')
depends=('ocaml' 'ocaml-bin_prot' 'ocaml-fieldslib' 'ocaml-ppx_assert' 'ocaml-ppx_bench' 'ocaml-ppx_driver' 'ocaml-ppx_expect' 'ocaml-ppx_inline_test' 'ocaml-ppx_jane' 'ocaml-result' 'ocaml-sexplib' 'ocaml-typerep' 'ocaml-variantslib')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz"
        "libdir.patch")
md5sums=('e56da86bcb955e6d65a2da04a973b11f'
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

  make install LIBDIR="${pkgdir}$(ocamlc -where)"
}
