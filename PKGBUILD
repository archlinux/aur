# Maintainer: robertfoster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-fdkaac
pkgver=0.3.3
pkgrel=1
pkgdesc="OCaml bingind for the fdk-aac library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-fdkaac"
license=('GPL')
depends=('ocaml' 'libfdk-aac')
makedepends=('ocaml-findlib' 'dune')
options=('!strip')
source=("https://github.com/savonet/ocaml-fdkaac/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('c660008a9c4fc397963ee8c135b6b1b666b700ce1193ba77986b3c97c71fb404')
