# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-base
pkgver=0.11.1
pkgrel=1
pkgdesc="Full standard library replacement for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/base'
license=('Apache')
depends=('ocaml' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/base/releases/download/v${pkgver}/base-v${pkgver}.tbz")
md5sums=('e7e7dc5db3f1fea19d74a31bbd4ac621')

build() {
  cd "${srcdir}/base-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/base-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
