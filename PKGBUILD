# Maintainer: otreblan <otreblain@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=drogon
pkgver=1.9.10
pkgrel=1
pkgdesc='A C++17 based HTTP web application framework running on Linux/macOS/Unix/Windows'
arch=('x86_64')
url="https://github.com/an-tao/drogon"
license=('MIT')
depends=('brotli' 'c-ares' 'jsoncpp' 'mariadb-libs' 'postgresql-libs' 'sqlite' 'hiredis' 'trantor')
makedepends=('cmake' 'mariadb' 'postgresql' 'util-linux')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('5de93fe16682388f363bb4b26ab00b0253d39108d8e7f53d5637c1b7da59a48f')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DUSE_SUBMODULE=OFF

	cmake --build build
}

package() {
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	DESTDIR="$pkgdir" cmake --install build
}
