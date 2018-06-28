# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_bench
pkgver=0.11.0
pkgrel=1
epoch=1
pkgdesc="A micro-benchmarking library for ocaml"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core_bench"
license=('Apache')
depends=('ocaml' 'ocaml-core' 'ocaml-core_extended' 'ocaml-ppx_jane' 'ocaml-textutils' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-re')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/core_bench-v${pkgver}.tar.gz")
md5sums=('24b1327b11adb200a4cc87298a335c22')

build() {
  cd "${srcdir}/core_bench-v${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/core_bench-v${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
