# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='js_of_ocaml'
pkgname="ocaml-$_projectname"
pkgver='6.1.1'
pkgrel='1'
pkgdesc='Compiler from OCaml to Javascript'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception')
depends=('binaryen' 'ocaml>=4.14.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-graphics' 'ocaml-lwt>=2.4.4' 'ocaml-lwt_log' 'ocaml-menhir' 'ocaml-ppxlib>=0.35.0' 'ocaml-react>=1.2.2' 'ocaml-reactivedata>=0.2' 'ocaml-sedlex>=3.3' 'ocaml-tyxml>=4.6' 'ocaml-yojson>=2.1.0' 'ocaml-findlib>=1.5.1' 'zstd')
makedepends=('dune>=3.19.0')
checkdepends=('ocaml-graphics' 'ocaml-num' 'ocaml-ppx_expect>=0.16.1' 'ocaml-qcheck' 'ocaml-re>=1.9.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('00dade3aef85bee78812b033d3ffb89a943eb2248c9a96dcaadb6b381b976a716a929b60ff94447672bf57f472af2fe5d57ce05d2f7ddbd9af15c5b2abcee7d6')

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
