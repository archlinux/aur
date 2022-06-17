# Maintainer: Zhiwei Chen <condy0919@gmail.com>

pkgname=merlin
pkgver=4.5
_pkgver=$pkgver-414
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('x86_64')
depends=('ocaml' 'ocaml-findlib' 'ocaml-yojson<2.0.0')
makedepends=('git' 'dune')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=("${url}/releases/download/v${_pkgver}/${pkgname}-${_pkgver}.tbz")
sha256sums=('31587b422b5ebd3eebda730e946868807d829128f8dc7153fb05c0c82742058e')
options=('!strip')
provides=('merlin')
conflicts=('merlin' 'vim-ocaml-merlin-git')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  dune build -p merlin
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  DESTDIR="${pkgdir}" dune install merlin --prefix="/usr" --libdir="/usr/lib/ocaml"

  # Dune installs documentation in /usr/doc, fix that.
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  rm "${pkgdir}"/usr/lib/ocaml/${pkgname}/dune-package
}

