# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_enumerate
pkgver=0.11.1
pkgrel=1
epoch=1
pkgdesc="Generate a list containing all values of a finite type"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_enumerate"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_enumerate/archive/v${pkgver}.tar.gz")
md5sums=('25107fc78678dc46058aa5d3a7f3ab84')

build() {
  cd "${srcdir}/ppx_enumerate-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_enumerate-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
