# Maintainer: G. W. Sherman <gwsherman (at) proton.me>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Maxime Arthaud <maxime@arthaud.me>

pkgname=zxing-cpp-tools
pkgver=2.2.1
pkgrel=2
pkgdesc="Tools from the repo examples of ZXing-C++ (zxing-cpp)"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
options=()
license=('Apache-2.0')
depends=('zxing-cpp')
makedepends=('git' 'cmake')
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02078ae15f19f9d423a441f205b1d1bee32349ddda7467e2c84e8f08876f8635')

build() {
	cmake -B build -S "zxing-cpp-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_EXAMPLES=ON -DBUILD_UNIT_TESTS=ON
	cmake --build build
}

check () {
	ctest --test-dir build --output-on-failure
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin" build/example/ZXing{Read,Writ}er
}

