# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=safu
pkgver=0.54.1
pkgrel=1
pkgdesc="C to library to reduce boiler plate code when use standard c-libs"
arch=('x86_64')
url="https://github.com/Elektrobit/safu"
license=('MIT')
depends=('glibc' 'json-c')
makedepends=(cmake)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cmake -B build \
  	-DCMAKE_BUILD_TYPE=Release \
	-DUNIT_TESTS=off \
	-DINSTALL_UNIT_TESTS=off \
	-DSAFU_MOCK_LIBRARY=off \
	-DCMAKE_INSTALL_PREFIX=/usr \
	.
  make -C build
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('bcaaf01956b06a3e6642c7ccc202e5c0')
