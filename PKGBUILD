# Maintainer: éclairevoyant

_pkgname=fpath
pkgname="ocaml-$_pkgname"
pkgver=0.7.3
pkgrel=1
license=('ISC')
arch=('x86_64')
pkgdesc="File system paths for OCaml"
url="https://erratique.ch/software/$_pkgname"
depends=('ocaml>=4.03.0' 'ocaml-astring')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=0.9.0' 'opam')
source=("$url/releases/$_pkgname-$pkgver.tbz")
options=('!strip')
md5sums=('0740b530e8fed5b0adc5eee8463cfc2f')

build() {
	cd $_pkgname-$pkgver
	ocaml pkg/pkg.ml build
}

package() {
	cd $_pkgname-$pkgver
	opam-installer --prefix "$pkgdir/usr" --libdir "lib/ocaml" --docdir "share/doc"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/share/doc/$_pkgname/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
