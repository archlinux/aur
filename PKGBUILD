# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=gcem
pkgver=1.18.0
pkgrel=1
pkgdesc="A C++ compile-time math library using generalized constant expressions"
url="https://github.com/kthohr/gcem"
arch=(any)
license=(Apache-2.0)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e71a9f5b62956da6c409dda44b483f98c4a98ae72184f3aa4659ae5b3462e61')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DGCEM_BUILD_TESTS=ON \
		-Wno-dev
	cmake --build build
	make -C build gcem_tests
}

check() {
	cd "$srcdir/build/tests"
	./exp.test
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}

