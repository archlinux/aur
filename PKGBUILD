# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-archive
pkgver=6.31.0
pkgrel=1
pkgdesc='Qt addon providing access to numerous types of archives'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-archive'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'bzip2'
	'glibc'
	'libstdc++'
	'openssl'
	'qt6-base'
	'xz'
	'zlib'
	'zstd'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('karchive')
conflicts=('karchive')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b0833f71ea7327525d5f197a750dcc1faeeb244ac33fba4222190d2ecc9d8e74')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
