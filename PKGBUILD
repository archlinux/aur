# Maintainer: Zhiwei Chen <condy0919@gmail.com>

pkgname=merlin
pkgver=4.3.1
_pkgver=$pkgver-412
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('x86_64')
depends=('ocaml>=4.12.0' 'ocaml<4.13' 'ocaml-findlib>=1.5.2' 'ocaml-yojson>=1.6.0')
makedepends=('git' 'dune>=1.8.0')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=("${url}/releases/download/v${_pkgver}/${pkgname}-v${_pkgver}.tbz")
sha256sums=('59030191e223ac5daf9cf1e406c60275cfa5e521d0414b6e77394318e4fa022a')
options=('!strip')
provides=('merlin')
conflicts=('merlin' 'vim-ocaml-merlin-git')

build() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"

  dune build -p merlin
}

package() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"

  DESTDIR="${pkgdir}" dune install merlin --prefix "/usr" --libdir "lib/ocaml"

  # Dune installs documentation in /usr/doc, fix that.
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  rm "${pkgdir}"/usr/lib/ocaml/${pkgname}/dune-package
}

