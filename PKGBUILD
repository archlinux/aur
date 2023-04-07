# Maintainer: Otreblan <otreblain@gmail.com>
# Contributor: Rafael Silva (perigoso) <perigoso@riseup.net>

pkgname=curlcpp
pkgver=3.0
pkgrel=1
epoch=
pkgdesc="An object oriented C++ wrapper for CURL"
arch=('x86_64')
url="https://github.com/JosephP91/curlcpp"
license=('MIT')
groups=()
depends=('curl')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fcb78774c493ca8f7fa51741dd75d43c8a5a04a788b47e44216ca4d9cf672344')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DBUILD_SHARED_LIBS='SHARED'

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
