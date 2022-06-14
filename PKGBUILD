# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='cinaps'
pkgname="ocaml-$_projectname"
pkgver='0.15.1'
pkgrel='3'
pkgdesc='Trivial Metaprogramming tool using the OCaml toplevel'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.0' 'ocaml-re>=1.8.0')
makedepends=('dune>=2.0.0')
checkdepends=('ocaml-ppx_jane')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ca53a9da8aa71ce7cddf7e24778e9c4d3f3e5784209da85a5a6b2d5af83cd8ad769fbe3009d2757ebf4a25ca39d76af00ebc693b1b01c3b53c8775ea479123a5')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
