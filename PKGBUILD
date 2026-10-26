# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-night-light
pkgver=6.8.0
pkgrel=1
pkgdesc='Helpers for scheduling the dark-light cycle'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-night-light'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-positioning'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-holidays'
	'sonic-frameworks-settings'
)
makedepends=(
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-internationalization'
)
provides=('knighttime')
conflicts=('knighttime')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('35efafd4780130043f645428d8ab42100300a212901fccd6e3d4996b11b44e86')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
