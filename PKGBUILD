# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='lwt-dllist'
pkgname="ocaml-$_projectname"
pkgver='1.0.1'
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
b2sums=('2d6151ae075e705b3c6d4a950bb88b4c77b92e430d75215b034073080e61f78c3431797a568308e2f73e36ecc8d6395ac10088289db9118ca917c0dbfcf7095a')

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
