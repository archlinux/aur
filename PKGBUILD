# Maintainer: éclairevoyant

_pkgname=odoc-parser
pkgname="ocaml-$_pkgname"
pkgver=2.0.0
pkgrel=1
license=('ISC')
arch=('x86_64')
pkgdesc="Parser for ocaml documentation comments"
url="https://github.com/ocaml-doc/$_pkgname"
depends=('ocaml>=4.02.0' 'ocaml-ppx_expect' 'ocaml-astring' 'camlp-streams' 'ocaml-result')
makedepends=('dune>=2.8')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tbz")
options=('!strip')
sha256sums=('407919fbb0eb95761d6fc6ec6777628d94aa1907343bdca678b1880bafb33922')
sha512sums=('d2bffa3e9f30471045682e390dcee7a2c1caf3831bca4bd57c16939e782c2e23434e6f1c9887580a1804800b3629ef4c4311a9d418fca5a939f324650d54006e')

build() {
	cd $_pkgname-$pkgver
	dune build -p $_pkgname
}

package() {
	cd $_pkgname-$pkgver
	DESTDIR="$pkgdir" dune install $_pkgname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/share/doc/$_pkgname/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
