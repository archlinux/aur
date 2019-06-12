# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-spawn
pkgver=0.13.0
pkgrel=1
pkgdesc="A small library for spawning sub-processes"
arch=('x86_64')
url='https://github.com/janestreet/spawn'
license=('MIT')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/spawn/releases/download/v${pkgver}/spawn-v${pkgver}.tbz")
sha512sums=('24195096d1b81f372b6be9e64485b29ab11649a30de050c3f59c87f9afac180218af60c1cccbed4520bda6b611467146b5bb5e5cc20c1ee96f6730657f645f31')

build() {
  cd "${srcdir}/spawn-v${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/spawn-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
