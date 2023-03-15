# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='gen'
pkgname="ocaml-$_projectname"
pkgver='1.1'
pkgrel='1'
pkgdesc='Simple, efficient iterators for OCaml'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('MIT')
depends=('ocaml>=4.03.0' 'ocaml-seq')
makedepends=('dune>=1.1.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('71a4b5c3666a7c11935398a78feea7383f61d2c549dfb96e324d40783ffa87b5ec492c5ec468803aabfb9b48e7d0ebaa30b24d2b974540afc7cca5feea3121c1')

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
