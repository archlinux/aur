# Maintainer: robertfoster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ffmpeg
pkgver=1.3.1 # renovate: datasource=github-tags depName=savonet/ocaml-ffmpeg
pkgrel=1
pkgdesc="OCaml bindings to the FFmpeg library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-ffmpeg"
license=('LGPL2.1')
depends=('ocaml' 'ffmpeg')
makedepends=('dune' 'ocaml-findlib')
options=('!strip')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha512sums=('e004f2ae2ce6105bb288efc83288afdc650d37ab65ada738256da21ba034f485a508daaed98a8732befcc986239876f0b57e703c174fb74fa93612ba68c219ee')
