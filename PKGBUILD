# Maintainer: osch <oliver@luced.de>

pkgname=lua-llthreads2
pkgver=0.1.5
pkgrel=1
pkgdesc="This is full dropin replacement for llthreads library"
arch=("i686" "x86_64")
url="http://github.com/moteus/lua-llthreads2/"
license=("MIT")
depends=("lua")
makedepends=("luarocks")
source=("$pkgname-$pkgver.tar.gz::https://github.com/moteus/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7399462ea97a22243f4d25d293d4b8b3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	luarocks make --pack-binary-rock "rockspecs/$pkgname-$pkgver-1.rockspec"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d                   "$pkgdir`pkg-config --variable=INSTALL_CMOD lua`"
	install -Dm755 llthreads2.so "$pkgdir`pkg-config --variable=INSTALL_CMOD lua`/llthreads2.so"

	cd ./src/lua/llthreads2
	
	install -d            "$pkgdir`pkg-config --variable=INSTALL_LMOD lua`"/llthreads2
	install -Dm644 ex.lua "$pkgdir`pkg-config --variable=INSTALL_LMOD lua`"/llthreads2/ex.lua

}
