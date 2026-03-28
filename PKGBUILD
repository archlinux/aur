# Maintainer: very-amused <very-amused at pm dot me>
# Contributor: sum01 <sum01 at protonmail dot com>
_pkgname=cpp-httplib
pkgname="${_pkgname}-notests"
provides=('cpp-httplib')
conflicts=('cpp-httplib')
pkgver=0.39.0
pkgrel=1
pkgdesc="A C++ header-only HTTP/HTTPS server and client library (no build tests)"
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
checkdepends=('gtest')
optdepends=('openssl>=3: HTTPS support' 'mbedtls: HTTPS support' 'wolfssl: HTTPS support' 'zlib: ZLIB compression support' 'brotli: Brotli compression support' 'zstd: Zstandard compression support')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('2970dd672a8ea49e558318d5224956c3f1d5b4c7e8b7345402f0705e22323e9b5b038eedcce996826e82b540d82b1836911a1b5d3ef99a9af1dbac2d5aa2f17e')
prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	meson setup build
	cd build
	meson configure -Dbuildtype=release \
		-Dtest=false \
		-Dprefix=/usr
}
build() {
	cd "$srcdir/$_pkgname-$pkgver/build"
	meson compile
}
package() {
	cd "$srcdir/$_pkgname-$pkgver/build"
	DESTDIR="$pkgdir" meson install
}
