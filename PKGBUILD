# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-jane-street-headers
pkgver=0.11.0
pkgrel=1
pkgdesc="Jane Street C header files"
arch=('x86_64')
url='https://github.com/janestreet/jane-street-headers'
license=('Apache')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/jane-street-headers-v${pkgver}.tar.gz")
md5sums=('13299bfe41f66f6a3f42cfaa015f4869')

build() {
  cd "${srcdir}/jane-street-headers-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/jane-street-headers-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
