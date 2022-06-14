# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='zed'
pkgname="ocaml-$_projectname"
pkgver='3.1.0'
pkgrel='4'
pkgdesc='Abstract engine for text edition in OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.02.3' 'ocaml-camomile>=1.0.1' 'ocaml-react' 'ocaml-charinfo_width>=1.1.0')
makedepends=('dune>=1.1.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d4457af15f970adb7b1ed543017e590fa0ecc47171d6dd520a1397f21ce0219caa30a9db7bedb76c0602d4f6d0f0684012cc33feafe18b848d3261a460dea10a')

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
