# Maintainer: éclairevoyant

_pkgname='chrome-trace'
pkgname="ocaml-$_pkgname"
pkgver=3.6.1
pkgrel=1
license=('MIT')
arch=('x86_64')
pkgdesc="Chrome trace event generation library"
url="https://github.com/ocaml/dune"
depends=('ocaml>=4.08.0')
makedepends=('dune>=3.5')
source=("$url/releases/download/$pkgver/dune-$pkgver.tbz")
options=('!strip')
sha256sums=('f1d5ac04b7a027f3d549e25cf885ebf7acc135e0291c18e6b43123a799c143ce')
sha512sums=('64714ab6155cd04bc33d693fc7a6d9d61aa7a278357eeff159df324e083914fcd556459a3945acacf1bbc3775f2232ab0c78006ab8a434dc58dcf95ffdffac52')

build() {
	cd dune-$pkgver
	dune build -p $_pkgname
}

package() {
	cd dune-$pkgver
	DESTDIR="$pkgdir" dune install $_pkgname --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/share/doc/$_pkgname/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
