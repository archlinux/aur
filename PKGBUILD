# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppxfind'
pkgname="ocaml-$_projectname"
pkgver='1.4'
pkgrel='7'
pkgdesc='Tool combining ocamlfind and ppx'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/diml/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-findlib' 'ocaml-migrate-parsetree')
makedepends=('dune>=2.0.0' 'ocaml-findlib')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('44beb6a723708a797a13fbe7f159708b88a2abf59338d9416bcf86b8f5ce650d99246d3488bd44e845f13e99e8d1e738456fe5b538f5a37803901dd9941c33bf')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
