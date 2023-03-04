# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: vri <t.j.a.devries(at)gmail(dot)com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=cpp-netlib
pkgver=0.13.0
pkgrel=1
pkgdesc='Cross-platform, standards compliant networking library'
arch=('x86_64')
url='https://github.com/cpp-netlib/cpp-netlib'
license=('custom:BSL')
depends=('gcc-libs' 'openssl')
makedepends=('boost' 'cmake')
provides=("libcppnetlib-client-connections.so=$pkgver" "libcppnetlib-uri-server-parsers.so=$pkgver" "libcppnetlib-uri.so=$pkgver")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver-final.tar.gz")
sha256sums=('897259d9f9087acba33911aec925804e6236a7a77f5444dedde6145049605a34')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgname-$pkgver-final" \
		-DCPP-NETLIB_BUILD_SHARED_LIBS=ON \
		-DCPP-NETLIB_BUILD_TESTS=OFF \
		-DCPP-NETLIB_BUILD_EXAMPLES=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBOOST_DIR=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd "$pkgname-$pkgname-$pkgver-final"
	install -Dvm644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
