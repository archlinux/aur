# Maintainer: éclairevoyant

_pkgname=odoc-parser
pkgname="ocaml-$_pkgname"
pkgver=1.0.1
pkgrel=1
license=('ISC')
arch=('x86_64')
pkgdesc="Parser for ocaml documentation comments"
url="https://github.com/ocaml-doc/$_pkgname"
depends=('ocaml>=4.02.0' 'ocaml-ppx_expect' 'ocaml-astring' 'camlp-streams' 'ocaml-result')
makedepends=('dune>=2.8')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tbz")
options=('!strip')
sha256sums=('a2bbe8e4201b60e980bab01e96e41f2ba0b05ba3f50b44f75837e8a2fb907d2c')
sha512sums=('c3339aae880ce72df866746d9ed9e7d38a752bf994ba24e948c086349604007e39602a1c31cf2ddb61ac8f8dc9dceccca43fe185850b83e3a02d75121f9ddfe2')

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
