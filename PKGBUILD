# Maintainer: balaraz <balaraz@tuta.io>

pkgname=unity-test
pkgver=2.6.1
pkgrel=1
pkgdesc="Simple unit testing for C"
arch=('x86_64')
url="https://github.com/throwtheswitch/unity"
license=('MIT')
makedepends=('cmake>=3.12')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b41a66d45a6b99758fb3202ace6178177014d52fc524bf1f72687d93e9867292')

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
