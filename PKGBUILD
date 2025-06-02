# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: éclairevoyant
_projectname='ocaml-version'
pkgname="ocaml-$_projectname"
pkgver='4.0.1'
pkgrel='1'
pkgdesc='Manipulate, parse and generate OCaml compiler version strings'
arch=('x86_64' 'aarch64')
url="https://github.com/ocurrent/$_projectname"
license=('ISC')
depends=('ocaml>=4.07.0')
makedepends=('dune>=3.6.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('990426519e62bf6c1e5d4bf6f250efc3ca2d3bb74f4399bb0bd65068f97739d1ef1059339c26095906cbf43d1d4f79292392be890b1f421e19322f9e91330edd')

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
