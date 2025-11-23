# Maintainer: marchnative <marchnative at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daurnimator <quae at daurnimator dot com>

pkgname=libmcl
pkgver=3.04
pkgrel=1
pkgdesc='Portable and fast pairing-based cryptography library'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'arm')
url='https://github.com/herumi/mcl'
license=('BSD')
depends=('gmp')
makedepends=('cmake')
provides=('libmcl.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6e1129ab8566ebbe5a26106953977178d3589578372d878dc4dc99db8e3a317b')

build() {
	cmake \
		-B build \
		-S "mcl-$pkgver" \
		-Wno-dev \
		-DMCL_BUILD_TESTING=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make -C build
}

check() {
	cd build
	ctest --output-on-failure
}

package() {
	make -C build DESTDIR="$pkgdir" install
	cd "mcl-$pkgver"
	install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
