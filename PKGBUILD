# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>
pkgname='ocaml-inotify'
pkgver='2.4.1'
pkgrel='1'
pkgdesc='OCaml bindings for inotify'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/whitequark/$pkgname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.03.0' 'ocaml-lwt')
makedepends=('dune>=2.9.0')
checkdepends=('ocaml-fileutils>=0.4.4' 'ocaml-ounit>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3e114ee0e8b5b9c7c996df0d2cd8f03e0efdfb9837c1990f98c256868c0e2ad275f91be1adcfbbbcf1bdab801f18e82efa483510d2566e0d12cb303dfc91e4e5')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
