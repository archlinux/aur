# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='lambda-term'
pkgname="ocaml-$_projectname"
pkgver='3.3.1'
pkgrel='2'
pkgdesc='Terminal manipulation library for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.08.0' 'ocaml-logs' 'ocaml-lwt>=4.2.0' 'ocaml-mew_vi>=0.5.0' 'ocaml-react' 'ocaml-zed>=3.2.0')
makedepends=('dune>=3.0.0')
options=('!strip')
install="$pkgname.install"
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0cbb35717012d648175cb74677e857973e40f153f3d85adb28bcbcfdaabb7b0f35c4b0ce88cd6f2158cedfab74d16acc1b3b987161a71dfda24892f34393b3ed')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
