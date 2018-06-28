# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-splittable_random
pkgver=0.11.0
pkgrel=1
pkgdesc="PRNG that can be split into independent streams"
arch=('x86_64')
url='https://github.com/janestreet/splittable_random'
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_jane' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/splittable_random-v${pkgver}.tar.gz")
md5sums=('9caf5111500c790f44967b6ee648bfe9')

build() {
  cd "${srcdir}/splittable_random-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/splittable_random-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
