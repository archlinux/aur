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
pkgver='2.2.6'
pkgrel='2'
pkgdesc='Unit testing framework for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gildor478/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.0' 'ocaml-lwt' 'ocaml-seq' 'ocaml-stdlib-shims')
makedepends=('dune>=1.11.0' 'ocaml-findlib')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4d808866dc4f9de6493a17910fafb2452398aef45cb29add54ed25e15a10ec7715bdd52d40190f618e77fe351d8bb67fbe12c1df6a6736c501792a57f6b3768a')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
