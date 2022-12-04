# Maintainer: éclairevoyant

_pkgname=either
pkgname="ocaml-$_pkgname"
pkgver=1.0.0
pkgrel=1
license=('MIT')
arch=('x86_64')
pkgdesc="Compatibility Either module"
url="https://github.com/mirage/$_pkgname"
depends=('ocaml')
makedepends=('dune>=2.0')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tbz")
options=('!strip')
sha256sums=('bf674de3312dee7b7215f07df1e8a96eb3d679164b8a918cdd95b8d97e505884')
sha512sums=('147854c09f897dd028b18a9f19acea8666107aaa7b1aab3c92f568af531364f57298edcaf3897d74246d3857d52e9bfb7ad0fc39220d988d9f14694ca1d5e9ed')

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
