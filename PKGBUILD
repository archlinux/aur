# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-sexplib0
pkgver=0.13.0
pkgrel=1
pkgdesc="Library containing the definition of S-expressions and some base converters"
arch=('x86_64')
url='https://github.com/janestreet/sexplib0'
license=('MIT')
depends=('glibc' 'ocaml')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/sexplib0-v${pkgver}.tar.gz")
sha512sums=('cf9dc665919a06fdddcecdfbf5fcd1b41c20acad5d18f31302f248df4c55b6cb4cf734b73f786a9169a316d0024fe243b83868ad7d881f4ccff5a8ad746a28ca')

build() {
  cd "${srcdir}/sexplib0-v${pkgver}"

  dune build --profile release
}


package() {
  cd "${srcdir}/sexplib0-v${pkgver}"

  dune install --destdir "${pkgdir}"
  install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
