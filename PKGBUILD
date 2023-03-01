# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='gen'
pkgname="ocaml-$_projectname"
pkgver='1.0'
pkgrel='1'
pkgdesc='Simple, efficient iterators for OCaml'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('MIT')
depends=('ocaml>=4.03.0' 'ocaml-seq')
makedepends=('dune>=1.1.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fb4ec2ab35a1aba0dcc8439b11f14a0a785d939f661f505aec88a6f2ca6ca87e14ddfda860d9c180b215190b76690de87040c144582f069224f7e58d37ef48a0')

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
