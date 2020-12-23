# Maintainer: Zhiwei Chen <condy0919@gmail.com>

pkgname=merlin
pkgver=3.4.2
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('x86_64')
depends=('ocaml' 'ocaml-findlib>=1.5.2' 'ocaml-yojson>=1.6.0')
makedepends=('git' 'dune>=1.8.0')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tbz")
sha256sums=('e1b7b897b11119d92995c558530149fd07bd67a4aaf140f55f3c4ffb5e882a81')
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

