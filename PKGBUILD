# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=samconf
pkgver=0.50.2
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
md5sums=('975e92527467874227f25b4d2762c1a4')
