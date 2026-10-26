# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=sonic-activity-manager-daemon
pkgver=6.8.0
pkgrel=1
pkgdesc='System service to manage user activities and track the usage patterns'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-activity-manager-daemon'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-settings'
	'sonic-frameworks-xml-gui'
)
makedepends=(
	'boost'
	'sonic-frameworks-cmake-modules'
)
provides=('kactivitymanagerd')
conflicts=('kactivitymanagerd')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6646d141e47256a1b41291b5064415e148a8d6175af635f4c1a0858955f5e2c0')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
