# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_opamname='charInfo_width'
pkgname="ocaml-${_opamname,,}"
pkgver='1.1.0'
pkgrel='8'
pkgdesc='Determine column width for a character'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kandu/$_opamname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-camomile>=1.0.0' 'ocaml-result')
makedepends=('dune')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-LICENSE::$url/raw/20aaaa6dca8f1e0b1ace55b6f2a8ba5e5910b620/LICENSE"
)
sha512sums=('c8dac9eb6f520213de69b23433e2f0d6a21578c70ae69fb682065e707363968959395a6ddc6c88893e08372a138287318634b52a8b4fb70ac988b4ad4a18b140'
            'cc7651913890fc71b496edb63d8eb683c14e64246e88fbb784c26d531a7a176def2962e935b65ae0ab2ff9ceac7d3cf233eb1db965d47c2cb9630c74312273f2')

_sourcedirectory="$_opamname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -Dm644 "../$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
