# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='base_quickcheck'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='2'
pkgdesc='Randomized testing framework, designed for compatibility with Base'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-ppx_base>=0.15.0' 'ocaml-ppx_fields_conv>=0.15.0' 'ocaml-ppx_let>=0.15.0' 'ocaml-ppx_sexp_message>=0.15.0' 'ocaml-ppx_sexp_value>=0.15.0' 'ocaml-splittable_random>=0.15.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e5362d70469c085239efaabbca6ca2558cb1609dfd2c3715d5c31047c8ae34b8304b9d28636806305f226929b0f9e3518b409de08f42f389963378f2aee6b351')

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
