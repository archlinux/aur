# Maintainer: balaraz <balaraz@tuta.io>

pkgname=unity-test
pkgver=2.6.0
pkgrel=1
pkgdesc="Simple unit testing for C"
arch=('x86_64')
url="https://github.com/throwtheswitch/unity"
license=('MIT')
makedepends=('cmake>=3.12')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa4c9fb1ae5fc5242f914c65f3557e817e40cb37f04a31e5ff76d1ab89dbf674')

build() {
	cmake \
		-B build \
		-S "Unity-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -Dm 644 "Unity-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
