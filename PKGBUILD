# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_diff'
pkgname="ocaml-$_projectname"
pkgver='0.17.1'
pkgrel='1'
pkgdesc='A PPX rewriter that generates the implementation of [Ldiffable.S]'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-gel>=0.17.0' 'ocaml-ppx_compare>=0.17.0' 'ocaml-ppx_enumerate>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-ppxlib_jane>=0.17.0' 'ocaml-ppxlib>=0.36.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('46c6a461bd8dfd046ff61aa54ea4e5909e59f4abe8871934384668c419fe654fd8ca89cd168d456bc8a0db7d3e974e7b4f05c48ccee44652251dde89a445c887')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# No tests available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
