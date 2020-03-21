# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='ppx_module_timer'
pkgname="ocaml-$_projectname"
pkgver='0.13.0'
pkgrel='1'
pkgdesc='Ppx rewriter that records top-level module startup times'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-base>=0.13.0' 'ocaml-ppx_base>=0.13.0' 'ocaml-ppxlib>=0.9.0' 'ocaml-stdio>=0.13.0' 'ocaml-time_now>=0.13.0')
makedepends=('dune>=1.5.1')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f1a17ce59a4efc0eca1baa226e3067f87bba0d2e3ce5e84e9df9b1d3c7632807')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
