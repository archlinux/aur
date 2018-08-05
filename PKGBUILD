# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-spawn
pkgver=0.12.0
pkgrel=2
pkgdesc="A small library for spawning sub-processes"
arch=('x86_64')
url='https://github.com/janestreet/spawn'
license=('Apache')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/spawn/releases/download/v${pkgver}/spawn-v${pkgver}.tbz")
md5sums=('f9c770cbe3856e6ed5b92ba3ce7c691c')

build() {
  cd "${srcdir}/spawn-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/spawn-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
