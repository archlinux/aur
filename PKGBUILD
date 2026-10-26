# Maintainer: callmetango
# Contributor:Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-disks
pkgver=6.8.0
pkgrel=1
pkgdesc='Monitors S.M.A.R.T. capable devices for imminent failure'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-disks'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'smartmontools'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-notifications'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-system-info'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('plasma-disks')
conflicts=('plasma-disks')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fa757234b5af1c878566d48bde9880db02ac0afd2ae7d55f7058399165f7b4e5')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
