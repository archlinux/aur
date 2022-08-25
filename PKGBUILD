# Maintainer: Lance Roy <ldr709@gmail.com>
#
# Mostly copied from ocaml-ppx_sexp_conv AUR package

_projectname='timezone'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='1'
epoch='1'
pkgdesc='Handles parsing timezone data into a Timezone.t that can later be used to manipulate time in core_kernel or core.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d50cd1e8f116f9121383b2d20d5dcbf99b5388a2fed915302f0566c6f2d93bdf1480c2f998fac6b81a636be52b601b38981b3083adaaf405a1154b63c0b0d6da')

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
