# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=samconf
pkgver=0.51.0
pkgrel=1
pkgdesc="A c library to manage confiugrations form differnt verified sources"
arch=('x86_64')
url="https://github.com/Elektrobit/samconf"
license=('MIT')
depends=('glibc' 'bash' 'json-c' 'safu' 'openssl')
makedepends=(cmake)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cmake -B build \
  	-DCMAKE_BUILD_TYPE=Release \
	-DUNIT_TESTS=off \
	-DINSTALL_UNIT_TESTS=off \
	-DCMAKE_INSTALL_PREFIX=/usr \
	.
  make -C build
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod o+r "$pkgdir/usr/bin/signature.sh"
}
md5sums=('c43ed5fba5cdd2f26470e597f6fb5a81')
