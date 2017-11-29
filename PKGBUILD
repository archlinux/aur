# Maintainer: Adrien Folie <folie.adrien@gmail.com>
pkgname=voidcsfml
pkgver=2.4.10
pkgrel=1
pkgdesc="C bindings to Simple and Fast Multimedia Library."
arch=(any)
url="https://github.com/oprypin/crsfml/tree/master/voidcsfml"
license=('ZLIB')
depends=('sfml')
makedepends=('cmake')
source=("https://github.com/oprypin/crsfml/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$srcdir/crsfml-$pkgver/$pkgname"
	cmake . && make
}

package() {
	cd "$srcdir/crsfml-$pkgver/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"

	for lib in audio graphics network system window; do
		install -Dm644 "libvoidcsfml-$lib.so.2.4" "$pkgdir/usr/lib/libvoidcsfml-$lib.so.2.4"
		install -Dm644 "libvoidcsfml-$lib.so.2.4" "$pkgdir/usr/lib/libvoidcsfml-$lib.so"
	done
}
