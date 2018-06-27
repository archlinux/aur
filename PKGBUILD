# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-compiler-libs-repackaged
pkgver=0.11.0
pkgrel=1
pkgdesc="OCaml compiler libraries repackaged"
arch=('x86_64')
url='https://github.com/janestreet/ocaml-compiler-libs'
license=('Apache')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ocaml-compiler-libs-v${pkgver}.tar.gz")
md5sums=('e170c16186aa55b7e8b11e461418a10a')

build() {
  cd "${srcdir}/ocaml-compiler-libs-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/ocaml-compiler-libs-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
