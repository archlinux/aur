# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ocplib-endian'
pkgname="ocaml-$_projectname"
pkgver='1.0'
pkgrel='3'
pkgdesc='Optimised functions to read and write int16/32/64 from strings, bytes and bigarrays'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/OCamlPro/$_projectname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml')
makedepends=('cppo' 'ocamlbuild' 'ocaml-findlib')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('76f268e1aff8dbac8b6a0ca9473f90255da35f15b0fcaf26a840cb6f73029243')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	./configure --disable-debug
	make build
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
	install -dm755 "$OCAMLFIND_DESTDIR"

	make install

	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 'COPYING.txt' "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
}
