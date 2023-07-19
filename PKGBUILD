# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domainslib'
pkgname="ocaml-$_projectname"
pkgver='0.5.1'
pkgrel='1'
pkgdesc='Nested-parallel programming library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-saturn>=0.4.0' 'ocaml-domain-local-await>=0.1.0')
makedepends=('dune>=3.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('67f455b7637b558b2cd06794150006fd6acb6a2472a26acd3e27dcb191e3e87077da15bbd737e4a4c377c33fb33d0125dbc42df26ffc3675713786504732c40c')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	mv "$pkgdir/usr/share/doc/$_projectname" "$pkgdir/usr/share/doc/$pkgname"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
