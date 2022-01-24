# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Eric Bailey <nerflad@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Contributor: Benjamin Andresen <benny(at)klapmuetz(dot)org>
# Contributor: Sylvester Johansson <syljo361(at)gmail(dot)org>
_projectname='ounit'
pkgname="ocaml-$_projectname"
pkgver='2.2.5'
pkgrel='1'
pkgdesc='Unit testing framework for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gildor478/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.0' 'ocaml-lwt' 'ocaml-stdlib-shims')
makedepends=('dune>=1.11.0' 'ocaml-findlib')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8f6009f9fad5832e76009ce870dd7236c804ff7e7f3e8a479371a4f72f0fc099ddaa1ec1e89eeaa11045a608597f7a3216adbd98deea9f28d274ff59cc5b121d')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
