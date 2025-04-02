# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='tsort'
pkgname="ocaml-$_projectname"
pkgver='2.2.0'
pkgrel='1'
pkgdesc='Easy to use and user-friendly topological sort module for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/dmbaturin/$pkgname"
license=('MIT')
depends=('ocaml>=4.03.0')
makedepends=('dune>=1.9.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('1caac78a7299680303ac265ddb5d1b61446e4ef27ee695d6442a075c4ab7aa258c7e447ce0bc5233230e7e2f269b3b2eda70d8b2530b83791e64068ff0e3408a')

_sourcedirectory="$pkgname-$pkgver"

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
