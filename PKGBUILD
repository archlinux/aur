# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='mmap'
pkgname="ocaml-$_projectname"
pkgver='1.1.0'
pkgrel='7'
pkgdesc='Provides a Mmap.map_file function for mapping files in memory'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.02.3')
makedepends=('dune>=1.6.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8540a5ca1cde87cb5c7bf9b987aac1b180e95c13578db2aa6775908df416c4ce6bba7bdd8ee616c9a50d175b58ee84234e7ed7ecc6276b3af6aac0b6ef09c37c')

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
