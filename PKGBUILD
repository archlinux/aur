# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domainslib'
pkgname="ocaml-$_projectname"
pkgver='0.5.0'
pkgrel='1'
pkgdesc='Nested-parallel programming library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-lockfree>=0.2.0')
makedepends=('dune>=3.0.0')
checkdepends=('ocaml-mirage-clock')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6a94afe0f24c6a97d4ad33036ff5c682529d28cd8470e125523d91448d86fd33d28ad9ab3ab56398d98666442d09b4b0d1d7750365bbdfd384a50dd940e65a4a')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
