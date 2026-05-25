# Maintainer: otreblan <otreblain@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=drogon
pkgver=1.9.13
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
sha256sums=('c3bd0e276b82576151dc7376c8d4027dd1fcec282d784849e11f84a7e977b2f5')

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
