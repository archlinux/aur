# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=samconf
pkgver=0.61.1
pkgrel=1
pkgdesc="A c library to manage confiugrations form differnt verified sources"
arch=('x86_64')
url="https://github.com/Elektrobit/samconf"
license=('MIT')
depends=('glibc' 'bash' 'json-c' 'safu' 'openssl')
makedepends=('cmake' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cmake -B build \
  	-DCMAKE_BUILD_TYPE=Release \
	-DUNIT_TESTS=off \
	-DINSTALL_UNIT_TESTS=off \
	-DSAMCONF_MOCK_LIBRARY=off \
	-DSAMCONF_DEMOS=off \
	-DCMAKE_INSTALL_PREFIX=/usr \
	.
  make -C build
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('b84505b4e17b0ad826a69d396e779e808785f0f8298609d68f8c7d02acb76a85')
