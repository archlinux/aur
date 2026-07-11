# Maintainer: robertfoster
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-camomile
pkgver=2.0.0
pkgrel=1
pkgdesc="Comprehensive Unicode library for OCaml"
arch=('i686' 'x86_64')
url=https://github.com/ocaml-community/Camomile
license=('LGPL')
depends=('ocaml-camlp-streams' 'ocaml-stdlib-random')
makedepends=('dune' 'ocaml-findlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "Camomile-${pkgver}"
  dune build
}

package() {
  cd "Camomile-${pkgver}"

  dune install \
    --destdir="${pkgdir}" \
    --prefix="/usr" \
    --libdir="$(ocamlfind printconf destdir)"

  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('6bb421d0bb81594acb5dd902101a0609022d576fe373d956724fa60120bfd03d')
