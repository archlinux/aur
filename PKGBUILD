# Maintainer: emersion <contact emersion fr>

_pkgname=lem
pkgname=$_pkgname-git
pkgver=2018.07.13.r0.g5056134
pkgrel=1
pkgdesc="Lem semantic definition language"
url='https://github.com/rems-project/lem'
license=('MIT')
arch=('any')
depends=('ocaml' 'ocamlbuild' 'ocaml-findlib' 'ocaml-zarith' 'ocaml-num')
source=('git+https://github.com/rems-project/lem.git')
sha512sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${_pkgname}
	make
}

package() {
	cd ${_pkgname}
	export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
	mkdir -p "$OCAMLFIND_DESTDIR"
	# The Makefile variable names don't make sense, but w/e
	make install INSTALL_DIR="${pkgdir}/usr" INSTALLDIR="$OCAMLFIND_DESTDIR"
}
