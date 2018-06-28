# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-parsexp
pkgver=0.11.0
pkgrel=1
pkgdesc="S-expression parsing library"
arch=('x86_64')
url='https://github.com/janestreet/parsexp'
license=('Apache')
depends=('ocaml' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/parsexp-v${pkgver}.tar.gz")
md5sums=('816fce8d14b71a379296577c803bdbca')

build() {
  cd "${srcdir}/parsexp-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/parsexp-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
