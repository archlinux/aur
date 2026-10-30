# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-print-management
pkgver=6.8.0
pkgrel=2
pkgdesc='A tool for managing print jobs and printers'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-print-management'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libcups'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-notifications'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-interface-libraries'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=('system-config-printer: auto-detect the printer driver')
provides=('print-manager')
conflicts=('print-manager')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ae235e77dc4f7792ac7c21843b385377c594ba8cabbe770e2ff5e534b6a0df74')

build() {
	cmake -B build  -S $pkgname-$pkgver \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
