# Maintainer: robertfoster
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Denis Wernert <denis@wernert.info>

pkgname=ocaml-ssl
pkgver=0.5.6
pkgrel=2
pkgdesc="OCaml SSL Library"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('custom')
depends=('ocaml' 'openssl')
makedepends=('bubblewrap' 'dune' 'ocaml-findlib')
source=("https://github.com/savonet/ocaml-ssl/archive/v$pkgver.tar.gz")
options=(!libtool !strip zipman !makeflags staticlibs)

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd ${pkgname}-${pkgver}

	# Initialize OPAM, this should be removed once opam is “removed” from dune
	export OPAMROOT="${srcdir}"/opam
	opam init -n

	# Work around the install command
	make OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)" install
	# Install LICENSE
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	awk 'BEGIN{P=0} /License/ {P = 1;} {if (P) print}' README.md > $pkgdir/usr/share/licenses/$pkgname/license
}

md5sums=('500b0bb7af4a736255ce706cc8e26762')
