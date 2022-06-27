# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
pkgname='ocaml-migrate-parsetree'
pkgver='2.4.0'
pkgrel='1'
pkgdesc='Convert OCaml parsetrees between different major versions'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$pkgname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9fb4fd69cc3eb64110127f9622cbb88ff1db3ecf45dc49377095d57c40ae2302b8e6928eda7e09b6e63f1820823c974ec479a8fa14b2a3f7da877faef0ca0414')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# fails because of a circular dependency on this package by lwt
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
