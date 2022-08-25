# Maintainer: Lance Roy <ldr709@gmail.com>
#
# Mostly copied from ocaml-ppx_sexp_conv AUR package

_projectname='ocaml_intrinsics'
pkgname="ocaml-intrinsics"
pkgver='0.15.2'
pkgrel='1'
epoch='1'
pkgdesc='Provides functions to invoke amd64 instructions (such as clz,popcnt,rdtsc,rdpmc) when available, or compatible software implementation on other targets.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('21539fecd8b40420bdb45a3fe79f65cf4ff0deb103c3cb2b28bad24fddce159bdfab3f7aa6ade0028bebef1602f860b1f6cdf2cc06db1a89e232b221d8ff592b')

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
