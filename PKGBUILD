# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>
_projectname='inotify'
pkgname="ocaml-$_projectname"
pkgver='2.6'
pkgrel='1'
pkgdesc='OCaml bindings for inotify'
arch=('x86_64' 'aarch64')
url="https://github.com/whitequark/$pkgname"
license=('LGPL-2.1-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=5.0.0' 'ocaml-eio' 'ocaml-lwt' 'ocaml-iomux>=0.3')
makedepends=('dune>=3.9.0')
checkdepends=('ocaml-fileutils>=0.4.4' 'ocaml-ounit>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('793573f9b7f8b51f810fd28c11b5bf329edb3e78ae1b4b66aaa9fa5115c8997e1e69b6d13b3441ada4611f0a1b20d3317a168a3a3b7560b340383a8452245c04')

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
