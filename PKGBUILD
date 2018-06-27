# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-configurator
pkgver=0.11.0
pkgrel=1
pkgdesc="Helper library for gathering system configuration"
arch=('x86_64')
url='https://github.com/janestreet/configurator'
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-stdio')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/configurator-v${pkgver}.tar.gz")
md5sums=('55511f3ea8e3d66439910b3324701218')

build() {
  cd "${srcdir}/configurator-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/configurator-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
