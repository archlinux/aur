# Maintainer: éclairevoyant

_pkgname=ocaml-version
pkgname="ocaml-$_pkgname"
pkgver=3.5.0
pkgrel=2
license=('ISC')
arch=('x86_64')
pkgdesc="Manipulate, parse and generate OCaml compiler version strings"
url="https://github.com/ocurrent/ocaml-version"
depends=('ocaml>=4.07.0')
makedepends=('dune>=1.0')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tbz")
options=('!strip')
sha256sums=('d63ca1c3970d6b14057f7176bfdae623e6c0176287c6a6e8b78cf50e2f7f635b')
sha512sums=('7b5f475897b1c560c81d322ca77b80099025102ec4163b410518e32dce0d6decf7c2ef671f795932bc173741b20bb442e07b182583423d2c990c632c921be5df')

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
