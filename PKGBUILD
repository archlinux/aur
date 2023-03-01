# Maintainer: Zhiwei Chen <condy0919@gmail.com>

pkgname=merlin
pkgver=4.8
_pkgver=$pkgver-500 # Yes, it builds
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('x86_64')
depends=('ocaml' 'ocaml-yojson' 'ocaml-csexp')
makedepends=('git' 'dune')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=("${url}/releases/download/v${_pkgver}/${pkgname}-${_pkgver}.tbz")
sha256sums=('9f93472aea34fe56667deed6b24aa75b7c66d52d0f9972924bddc10caae98c22')
options=('!strip')
conflicts=('vim-ocaml-merlin-git')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make all
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  DESTDIR="${pkgdir}" dune install merlin --prefix="/usr" --libdir="/usr/lib/ocaml"

  # Dune installs documentation in /usr/doc, fix that.
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  rm "${pkgdir}"/usr/lib/ocaml/${pkgname}/dune-package
}

