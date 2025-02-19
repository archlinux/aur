# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='calendar'
pkgname="ocaml-$_projectname"
pkgver='3.0.0'
pkgrel='1'
pkgdesc='OCaml library for handling dates and times'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('LGPL-2.1-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.03.0' 'ocaml-re>=1.7.2')
makedepends=('dune>=1.0.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f604538754681690bd40383c28130799bf286d2c4c8f49a42a9676a6155ce13d8392eff277c2b46c2cc4ead258a91d1347010d495a422429243f172b6301c9ec')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
