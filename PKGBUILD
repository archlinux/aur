# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-bluetooth
pkgver=6.31.0
pkgrel=1
pkgdesc='Qt wrapper for Bluez 5 DBus API'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-bluetooth'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'bluez'
	'glibc'
	'libstdc++'
	'qt6-base'
)
makedepends=(
	'doxygen'
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('qt6-declarative: QML bindings')
provides=('bluez-qt')
conflicts=('bluez-qt')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('68575737ef8f2c5aa626bcdf97628590dfcb22034319b12b9a27593a04b19c11')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
