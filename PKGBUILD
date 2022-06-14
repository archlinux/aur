# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mew_vi'
pkgname="ocaml-$_projectname"
pkgver='0.5.0'
pkgrel='4'
pkgdesc='Vi-like modal editing engine generator'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kandu/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-mew>=0.1.0' 'ocaml-react')
makedepends=('dune>=1.1.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f6ee1375ceee60ccae1799d07a8bc55684fdbffc2275147ef19cf3c7d242663764e6630b9423287a78efacba17f410971e3fc397d202effb331f94dc00797eb0')

_sourcedirectory="$_projectname-$pkgver"

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

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
