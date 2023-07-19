# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='thread-table'
pkgname="ocaml-$_projectname"
pkgver='0.1.0'
pkgrel='1'
pkgdesc='A lock-free thread-safe integer keyed hash table '
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0')
makedepends=('dune>=3.3.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('18771ae7b18f5263fa1741da147c1bd05e573b389c5b5108e20bf070db40c846341833e10d2c28fbe92eec9caa047c20b46bc947b721cd8f95b9198e010ef0ce')

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
