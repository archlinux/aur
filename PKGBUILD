# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='time_now'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='4'
pkgdesc='Reports the current time'
# If you're running on i686, pentium4, armv7h or aarch64, you have to add it to the arch array of the ocaml-biniou, ocaml-easy-format and ocaml-yojson AUR dependencies
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-jane-street-headers>=0.15.0' 'ocaml-jst-config>=0.15.0' 'ocaml-ppx_base>=0.15.0' 'ocaml-ppx_optcomp>=0.15.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b24bf9fda05cc84c568cc8637771e8774661df738719b4ad30f86ae4a9a984e9f1d344dc58ab6014d37275e99e92bf3b2d34a8c4dfc474faf00c6096f679e371')

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
