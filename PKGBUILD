# Maintainer: otreblan <otreblain@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=drogon
pkgver=1.9.4
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
sha256sums=('b23d9d01d36fb1221298fcdbedcf7fd3e1b8b8821bf6fb8ed073c8b0c290d11d')

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
