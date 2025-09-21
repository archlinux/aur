# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='iomux'
pkgname="ocaml-$_projectname"
pkgver='0.4'
pkgrel='1'
pkgdesc='Io multiplexers bindings for ocaml (poll/kqueue/epoll and so on)'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$pkgname"
license=('ISC')
depends=('ocaml>=4.08.0' 'dune>=3.19.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('81f810daf04c3b93c8816caa471e46f478fe8e246eac2ba9f4adbb74cbfc4ef8500636667ed2c8f4d4e838abd9bde5dff839861d79de19c1e6ea02d3b643bf6b')

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
