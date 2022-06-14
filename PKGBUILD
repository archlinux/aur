# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='wtf8'
pkgname="ocaml-$_projectname"
pkgver='1.0.2'
pkgrel='7'
pkgdesc='An ocaml library that implements a WTF-8 encoder and decoder'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/flowtype/$pkgname"
license=('MIT')
depends=('ocaml>=4.01.0')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3e7a65e0085a84648e4758faf6873a7b6d037d0e45ac6be3f545b0ab9676287a31b803d5ceb0d93f8f34b771dd80b7b8770af06227a2ebfc8e0a9f12d21a7215')

_sourcedirectory="$pkgname-$pkgver"

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
