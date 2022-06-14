# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_tools'
pkgname="ocaml-$_projectname"
pkgver='6.5'
pkgrel='2'
pkgdesc='Tools for authors of ppx rewriters and other syntactic tools'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0')
makedepends=('cppo>=1.1.0' 'dune>=1.6.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1dc3f62307690161fc7d9f54715918341429bbe13dd68744e9468b41ab7c15ec95cb865135d11c3e3edc6cfb02658b0c731ce1e7756267cf71143ea8e88318fe')

_sourcedirectory="$_projectname-$(printf '%s' "$pkgver" | tr '+' '-')"

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
