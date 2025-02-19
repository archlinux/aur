# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='bigstringaf'
pkgname="ocaml-$_projectname"
pkgver='0.10.0'
pkgrel='1'
pkgdesc='Bigstring intrinsics and fast blits based on memcpy/memmove for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/inhabitedtype/$_projectname"
license=('BSD-3-Clause')
depends=('dune>=3.0.0' 'ocaml>=4.08.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('15c6ea44b824afee2ba33178ecd34af5bb6e01506960dab4a87a95bdc877f2c9c0e5cbb25c5fbd86bb1539dff3eb4c2b6a3bb2e9c5197e9371164e61b5eba6a9')

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
