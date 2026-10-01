# Maintainer: robertfoster
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ocaml-camomile
pkgver=2.1.0 # renovate: datasource=github-tags depName=ocaml-community/Camomile
pkgrel=1
pkgdesc="Comprehensive Unicode library for OCaml"
arch=('x86_64')
url=https://github.com/ocaml-community/Camomile
license=('LGPL-2.1-or-later')
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

sha256sums=('368fbfd4d3bc140078fdc46c68f75b6d1a4cc421f58447b401af45a7d41f4e58')
