# Maintainer: éclairevoyant

_pkgname=fix
pkgname="ocaml-$_pkgname"
pkgver=20220121
pkgrel=1
license=('custom:LGPL-2.0-only')
arch=('x86_64')
pkgdesc="Algorithmic building blocks for memoization, recursion, and more"
url="https://gitlab.inria.fr/fpottier/fix"
depends=('ocaml>=4.03')
makedepends=('dune>=1.3')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/archive.tar.gz")
options=('!strip')
sha256sums=('953bdbe0711f22d92c284adc7be86a9669c5b69ed0fc31ab76f6383ca6eda8ad')
sha512sums=('a851d8783c0c519c6e55359a5c471af433058872409c29a1a7bdfd0076813341ad2c0ebd1ce9e28bff4d4c729dfbc808c41c084fe12a42b45a2b5e391e77ccd2')
_commit=a288f05de716bcc9e82527f4cf440f9aebe965ae

build() {
	cd $_pkgname-$pkgver-$_commit
	dune build -p $_pkgname
}

package() {
	cd $_pkgname-$pkgver-$_commit
	DESTDIR="$pkgdir" dune install $_pkgname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/share/doc/$_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
