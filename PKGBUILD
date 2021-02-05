# Maintainer: Antoine Viallon <antoine.vaillon@gmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=kpack
pkgver=1.1.1
pkgrel=2
license=('MIT')
pkgdesc='Manipulates KnightOS software packages'
groups=("knightos")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/kpack'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7afadda597144b55ae63359b59028359d28c7363739ae0b47822ded606245ff0')

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
