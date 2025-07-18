# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_deriving'
pkgname="ocaml-$_projectname"
pkgver='6.1.1'
pkgrel='1'
epoch='1'
pkgdesc='Type-driven code generation for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.05.0' 'ocaml-findlib' 'ocaml-ppx_derivers' 'ocaml-ppxlib>=0.36.0' 'zstd')
makedepends=('cppo>=1.1.0' 'dune>=1.6.3')
checkdepends=('ocaml-ounit')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6e6ef6b2ace6413de9f40420075148737738ad6834164ae037c851ff4b7b7511ecbce4068228898d69a5fb0b32081e376fbd52e278c9c38fd8d3080f28c12c67')

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
