# Maintainer: Lance Roy <ldr709@gmail.com>
#
# Mostly copied from ocaml-core AUR package

_projectname='core_unix'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='1'
epoch='1'
pkgdesc="Unix-specific extensions to some of the modules defined in core and core_kernel."
arch=('x86_64' 'i686')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=(
	'ocaml>=4.08.0'
	'ocaml-core>=0.15'
	'ocaml-core_kernel>=0.15'
	'ocaml-expect_test_helpers_core>=0.15'
	'ocaml-jane-street-headers>=0.15'
	'ocaml-jst-config>=0.15'
	'ocaml-intrinsics>=0.15'
	'ocaml-ppx_jane>=0.15'
	'ocaml-sexplib>=0.15'
	'ocaml-timezone>=0.15'
	'ocaml-spawn>=0.15'
	)
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('eeb53bd0c06a7d1facfb133f0a45a232d57941eff644d4ed6c2d5002acd4e6b323376ec9c05838f760ebd9da3fbc39332989ed50b3921191c175811c947fcbfe')

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
