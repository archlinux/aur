# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_ignore_instrumentation'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='2'
pkgdesc='Ignore Jane Street specific instrumentation extensions'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ec411cb7a191fcb36f9a29f8ff3839db6f4031e30fa3444896a07235950ca04562a701b3bc7bc5df95e3ff82cfe8996be75bd5dce4bcce8a491898df1bffc50d')

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
