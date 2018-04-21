# Maintainer: robertfoster
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-camomile
pkgver=1.0.1
pkgrel=1
pkgdesc="Comprehensive Unicode library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/yoriyuki/Camomile"
license=('LGPL')
makedepends=('ocaml' 'dune')
source=(https://github.com/yoriyuki/Camomile/archive/$pkgver.tar.gz)
options=(!strip !makeflags staticlibs)

build() {
	cd Camomile-${pkgver}
	make all
}

check() {
	cd Camomile-${pkgver}
	make test
}

package() {
	cd Camomile-${pkgver}

	# Initialize OPAM, this should be removed once opam is “removed” from dune
	export OPAMROOT="${srcdir}"/opam
	opam init -n

	# Work around the install command
	make OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)" install
}

md5sums=('9557fd86f13eba45474fc1336f225f32')
