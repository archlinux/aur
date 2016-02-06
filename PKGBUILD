# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_bench
pkgver=113.24.00
pkgrel=1
license=('unknown')
arch=('i686' 'x86_64')
pkgdesc="A micro-benchmarking library for ocaml"
url="https://github.com/janestreet/core_bench"
depends=('ocaml' 'ocaml-bin_prot' 'ocaml-core' 'ocaml-core_extended' 'ocaml-fieldslib' 'ocaml-ppx_assert' 'ocaml-ppx_bench' 'ocaml-ppx_driver' 'ocaml-ppx_expect' 'ocaml-ppx_inline_test' 'ocaml-ppx_jane' 'ocaml-sexplib' 'ocaml-textutils' 'ocaml-typerep' 'ocaml-variantslib')
makedepends=('ocaml-findlib')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-${pkgver}.tar.gz"
        "libdir.patch")
options=('!strip')
md5sums=('ea8cdcc38e900e6ee0c3fa211214b5d0'
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
