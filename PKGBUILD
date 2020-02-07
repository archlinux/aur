# Maintainer: Zhiwei Chen <condy0919@gmail.com>

pkgname=merlin
pkgver=3.3.3
pkgrel=3
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('x86_64')
depends=('ocaml' 'ocaml-findlib>=1.5.2' 'ocaml-yojson>=1.6.0')
makedepends=('git' 'dune>=1.8.0')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tbz")
sha256sums=('72909ef47eea1f6fca13b4109a34dccf8fe3923a3c026f1ed1db9eb5ee9aae15')
options=('!strip')
provides=('merlin')
conflicts=('merlin' 'vim-ocaml-merlin-git')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  dune build -p merlin
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  DESTDIR="${pkgdir}" dune install merlin --prefix "/usr" --libdir "lib/ocaml"

  # Dune installs documentation in /usr/doc, fix that.
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  rm "${pkgdir}"/usr/lib/ocaml/${pkgname}/dune-package
}

