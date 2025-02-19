# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='iomux'
pkgname="ocaml-$_projectname"
pkgver='0.3'
pkgrel='1'
pkgdesc='Io multiplexers bindings for ocaml (poll/kqueue/epoll and so on)'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$pkgname"
license=('ISC')
depends=('ocaml>=4.08.0' 'dune>=3.6.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('519ca3a16609e8f6fa815983312baf1a5dbb828e2d9eb709e32a09e2632f2b18679961eb3de7e78c11a0dfab5cb217ffd996166e008f67bdd732c5bca6c0ac50')

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
