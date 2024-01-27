# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mirage-clock'
pkgname="ocaml-$_projectname"
pkgver='4.2.0'
pkgrel='1'
pkgdesc='Libraries and module types for portable clocks'
arch=('x86_64' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0')
makedepends=('dune>=2.8.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7c32adf30505fe35a1313c162731b96e283a883dbc18d530344830a1f76d3397a6dd3b76a4ac3024aa02ff917d228c953c9ebdfeeae1f48686e776007234edda')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
