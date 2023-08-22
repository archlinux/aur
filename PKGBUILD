# Maintainer: éclairevoyant

_pkgname=ocaml-version
pkgname="ocaml-$_pkgname"
pkgver=3.6.1
pkgrel=1
license=(ISC)
arch=(x86_64)
pkgdesc="Manipulate, parse and generate OCaml compiler version strings"
url="https://github.com/ocurrent/ocaml-version"
depends=('ocaml>=4.07.0')
makedepends=('dune>=1.0')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tbz")
options=('!strip')
sha256sums=('00a09a5d47a127757cb844f5b540c36c8cc8f2566fe5aca0c6121b476d719d32')
sha512sums=('9768b5916c05cd681b4f17a47c140a482fe2ed97d7ccc9bc1847b682067efbc145c947065d2f5f30bc6bd02f1cc72db4100a397d16b2af99268ff2220bd2e346')

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
