pkgname=mapbox-gl-qml
pkgver=2.1.1
pkgrel=1
pkgdesc="Mapbox GL Native bindings for Qt QML"
arch=(x86_64 aarch64)
url="https://github.com/rinigus/$pkgname"
license=(LGPL3)
depends=(mapbox-gl-native qt5-location)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('0d9495767e300889521d3fe0f8d4caa36cfcc02a25279a078f6b71e2041d3a8b14c52f0e89f42a3c95d6e311aea761d214cc50cd820f335632faea495f08ed2f')

build() {
	cmake -B build -S $pkgname-$pkgver \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DUSE_CURL_SSL=OFF
	cmake --build build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
