# Maintainer: éclairevoyant
# Contributor: endlesseden <eden at rose dot place>

pkgname=fast_float
pkgver=5.2.0
pkgrel=2
pkgdesc='Fast and exact implementation of the C++ from_chars functions:4x faster than strtod'
arch=(any)
url="https://github.com/fastfloat/$pkgname"
license=(Apache Boost MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('39133eda20acd5f1f049e8040815a67aee588ab93be4953bde3b9227fb691e099581ef79b12b740437b78a9b4c9007762b44d9726ca07505ad5cb51394d8e3fd')

build() {
	cmake -B build -S $pkgname-$pkgver \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 $pkgname-$pkgver/LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
