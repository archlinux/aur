# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-notification-settings
pkgver=6.31.0
pkgrel=1
pkgdesc='Configuration system for SonicDE notify'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-notification-settings'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libcanberra'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-settings'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('knotifyconfig')
conflicts=('knotifyconfig')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('54c64f9725f1a7cded36da2328a83aaa4b34720fed32ea786c3022343c03f150')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
