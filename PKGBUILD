# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_tools_versioned'
pkgname="ocaml-$_projectname"
pkgver='5.4.0'
pkgrel='5'
pkgdesc='Tools for authors of ppx rewriters and other syntactic tools (with ocaml-migrate-parsetree support)'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.0' 'ocaml-migrate-parsetree>=1.7.0')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('7f0421dbb42b43acc4f7892ac1c4c0ac13bdc188400d308688c4548b228aaf8bd80a4e2294672b50c78ac61e3c8df148c98d16b59f48292f02be40e7fd9640a9')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
