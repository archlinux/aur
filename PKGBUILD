# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='ppx_gen_rec'
pkgname="ocaml-$_projectname"
pkgver='1.1.0'
pkgrel='3'
pkgdesc='A ppx rewriter that transforms a recursive module expression into a `struct`'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/flowtype/$pkgname"
license=('MIT')
depends=('ocaml' 'ocaml-migrate-parsetree>=1.1.0')
makedepends=('dune')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3aa36a8875d02a81406681fa4f38cd51be4c0f8539345bfdf052844ec982fa0e')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
