# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=unity-test
pkgver=2.5.2
pkgrel=1
pkgdesc="Simple unit testing for C"
arch=('x86_64')
url="https://github.com/throwtheswitch/unity"
license=('MIT')
makedepends=('cmake>=3.12')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3786de6c8f389be3894feae4f7d8680a02e70ed4dbcce36109c8f8646da2671a')

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
