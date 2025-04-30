# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='lwt-dllist'
pkgname="ocaml-$_projectname"
pkgver='1.1.0'
pkgrel='1'
pkgdesc='Mutable doubly-linked list with Lwt iterators for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.0')
makedepends=('dune')
checkdepends=('ocaml-lwt')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('7c4ef1d2034c2c06fc7bf2923e9461c6ccb0278d64fc6858119201266066a211ec986c67ee5edb19c9f7dd5b83be695236066cf646ef039eff5badd1cfe19070')

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
