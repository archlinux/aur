# Maintainer: Antoine Viallon <antoine.vaillon@gmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=kpack
pkgver=1.1.0
pkgrel=2
license=('MIT')
pkgdesc='Manipulates KnightOS software packages'
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/kpack'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3b1ac534db30e67820d0d1849eee8c675e1a5cf041013e3020f68440cc7ed26d')

build() {
	cd "$pkgname-$pkgver"
	CFLAGS+=" -Wno-error=unused-result -Wno-error=stringop-overflow"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" make install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
