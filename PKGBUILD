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
pkgver='2.2.7'
pkgrel='2'
pkgdesc='Unit testing framework for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/gildor478/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.0' 'ocaml-lwt>=2.5.2' 'ocaml-seq' 'ocaml-stdlib-shims')
makedepends=('dune>=3.0.0' 'ocaml-findlib')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b2cefed53127f724c099391eefe1bce3b43cad5d6b629b5f1e9446b58892639de758f5dbcbd5efb6c409ce77ed01d06693989a3ba909cf79c36c2554c1473396')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
