# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-sexplib0
pkgver=0.11.0
pkgrel=1
pkgdesc="Library containing the definition of S-expressions and some base converters"
arch=('x86_64')
url='https://github.com/janestreet/sexplib0'
license=('MIT')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/sexplib0-v${pkgver}.tar.gz")
md5sums=('1c14ba30b471e49f1b23fea5ff99ea6b')

build() {
  cd "${srcdir}/sexplib0-v${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/sexplib0-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm755 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
