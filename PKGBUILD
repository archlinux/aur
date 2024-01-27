# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='jst-config'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
pkgdesc='Compile-time configuration for Jane Street libraries'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-base>=0.16.0' 'ocaml-ppx_assert>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('379446360c454c90ee80ed08dda3c34aff05d7026e77f868c33eb2fe93921e1ae9412bb69a5c92d54179d5465e0a1aab38cbf8ad55a86b2d164784015152c4ac')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
