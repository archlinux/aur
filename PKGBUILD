# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_enumerate
pkgver=0.12.0
pkgrel=1
epoch=1
pkgdesc="Generate a list containing all values of a finite type"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_enumerate"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_enumerate/archive/v${pkgver}.tar.gz")
sha512sums=('05719d0ab8f6e9f76ff3bcdb589d69119e65d303e91a2f65c63a031330e42ff4171f9b380ab824ccd193d749a8884e8e30f24df02a84e1718af4d6f3177cd547')

build() {
  cd "${srcdir}/ppx_enumerate-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/ppx_enumerate-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
