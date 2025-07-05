# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_globalize'
pkgname="ocaml-$_projectname"
pkgver='0.17.2'
pkgrel='1'
pkgdesc='A ppx rewriter that generates functions to copy local values to the global heap'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppxlib_jane>=0.17.0' 'ocaml-ppxlib>=0.36.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('c30de96b912869169699b2ee12c82922016acff79934a9f921c9fb5cbfdeaa05ad7bc6f18fa1f58207f2faad8fe4c30e24670817357ddd96befbdf3db58bc367')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
