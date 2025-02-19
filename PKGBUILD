# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domain-local-timeout'
pkgname="ocaml-$_projectname"
pkgver='1.0.1'
pkgrel='1'
pkgdesc='A scheduler independent timeout mechanism for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=4.12.0' 'ocaml-mtime>=2.0.0' 'ocaml-psq>=0.2.1' 'ocaml-thread-table>=1.0.0')
makedepends=('dune>=3.3.0')
checkdepends=('ocaml-alcotest>=1.7.0' 'ocaml-domain-local-await>=1.0.0' 'ocaml-mdx>=2.3.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('96c800149215087910ae5257e742826f25b9081ea134d29004b2b6d7fbb5f05e5773aadd72337f1d458fde58ec9d9e08d703bd46eb900374c7b0b53371c6017a')

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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
