# Maintainer: robertfoster
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-camomile
pkgver=1.0.1
pkgrel=3
pkgdesc="Comprehensive Unicode library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/yoriyuki/Camomile"
license=('LGPL')
makedepends=('dune' 'ocaml' 'ocaml-findlib' 'opam')
source=(https://github.com/yoriyuki/Camomile/archive/$pkgver.tar.gz)
options=(!strip !makeflags staticlibs)

build() {
	cd Camomile-${pkgver}
	jbuilder build @install
}

check() {
	cd Camomile-${pkgver}
	jbuilder runtest
}

package() {
	cd Camomile-${pkgver}

	mkdir -p "$pkgdir"/usr/lib/ocaml
	jbuilder install \
		--destdir="$pkgdir" \
		--libdir="/usr/lib/ocaml"

	cd "$pkgdir"

	# There's just a readme.
	rm -Rf usr/doc

	# Remove annotation files and sources.
	rm -Rf usr/lib/ocaml/$_pkgname/*.cmt*
	rm -Rf usr/lib/ocaml/$_pkgname/*.ml
}

md5sums=('9557fd86f13eba45474fc1336f225f32')
