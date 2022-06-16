# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='mmap'
pkgname="ocaml-$_projectname"
pkgver='1.2.0'
pkgrel='1'
pkgdesc='Provides a Mmap.map_file function for mapping files in memory'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.02.3' 'ocaml-bigarray-compat')
makedepends=('dune>=1.6.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cef6c37953d62f2f7472147a03707d60401d92aaf4ddb2dbaa697ee4eee252f70d8068e8fe5c6a36e005d4cc738f61d2c5bea12d844f1e3a696fef2f6546d59c')

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
