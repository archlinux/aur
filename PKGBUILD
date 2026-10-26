# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-plasma5-support-library
pkgver=6.8.0
pkgrel=1
pkgdesc='Support components for porting from KF5/Qt5 to KF6/Qt6'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-plasma5-support-library'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libx11'
	'libxfixes'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-holidays'
	'sonic-frameworks-idle-tracker'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-notifications'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-unit-conversion'
	'sonic-system-monitor-library'
)
makedepends=(
	'gpsd'
	'sonic-activities'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-networkmanager'
)
optdepends=(
	'gpsd: GPS-based geolocation dataengine'
	'sonic-activities: activities dataengine'
	'sonic-frameworks-networkmanager: IP-based geolocation dataengine'
)
provides=('plasma5support')
conflicts=('plasma5support')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e9b1a99fe2123129dffe9864c20ff1bc1552a4f93fa6b725bc9361f74011a20f')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
