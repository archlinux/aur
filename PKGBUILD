# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='monolith'
pkgname="ocaml-$_projectname"
pkgver='20250922'
pkgrel='1'
pkgdesc='A framework for strong random testing of OCaml libraries'
arch=('x86_64' 'aarch64')
url="https://gitlab.inria.fr/fpottier/$_projectname"
license=('LGPL-3.0-or-later')
depends=('ocaml>=4.12.0' 'ocaml-afl-persistent>=1.3' 'ocaml-pprint>=20200410')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_projectname-$pkgver.tar.gz")
b2sums=('347428f3d7a8763e0bdbae6d919ccd8d73a35665d148429f9d6b4d27e1b7506e018a094384571dd63040148905def376b09cb811ecf03c8ee5e32ecf5ca6e883')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# No tests available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LGPL-3.0-or-later"
}
