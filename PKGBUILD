# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-device-integration
pkgver=6.31.0
pkgrel=1
pkgdesc='Hardware integration and detection'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-device-integration'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libimobiledevice'
	'libplist'
	'libstdc++'
	'libudev.so'
	'media-player-info'
	'qt6-base'
	'udisks2'
	'upower'
	'util-linux-libs'
)
makedepends=(
	'doxygen'
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('qt6-declarative: QML bindings')
provides=('solid')
conflicts=('solid')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('099c1a79b2d35a43fa4b06a176d8bd1d3d613ed9c50370c83bffb6771443b6d3')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
