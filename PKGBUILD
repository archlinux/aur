# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='dtoa'
pkgname="ocaml-$_projectname"
pkgver='0.3.3'
pkgrel='2'
pkgdesc='double-to-ascii ocaml implementation'
arch=('x86_64' 'aarch64')
url="https://github.com/flow/$pkgname"
license=('MIT')
depends=('ocaml>=4.01.0')
makedepends=('dune>=2.0.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f5d9a287637c7a32c48ad2bbb0d7420c1b59fca26e2569b234d8f0e7b2d6b99d3f3cf0f2755e50d51c7453422593c2be6a54a90f49dfd672622c04f52c92359e')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
