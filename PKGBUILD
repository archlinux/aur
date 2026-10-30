# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-tv-interface
pkgver=6.8.0
pkgrel=2
pkgdesc='SonicDE interface for TVs'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-tv-interface'
license=('GPL-2.0-or-later')
depends=(
	'glibc'
	'kdeconnect'
	'libcec'
	'libgcc'
	'libstdc++'
	'plasma-nano'
	'qcoro'
	'qt6-base'
	'qt6-declarative'
	'qt6-multimedia'
	'qt6-webengine'
	'sdl3'
	'sh'
	'sonic-activities'
	'sonic-file-search-ui'
	'sonic-frameworks-app-info'
	'sonic-frameworks-bluetooth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notifications'
	'sonic-frameworks-package'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-windowsystem'
	'sonic-interface-libraries'
	'sonic-screen-library'
	'sonic-workspace'
)
makedepends=('sonic-frameworks-cmake-modules')
((USE_SYSTEMD)) || optdepends+=(
	'udev: processing of the uinput device rule'
	'esettingsd: timedate1 service for dinit, runit or s6'
	'openrc-settingsd: timedate1 service for OpenRC'
)
provides=('plasma-bigscreen')
conflicts=('plasma-bigscreen')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('143091666dba8d26ec286b43b8cc7fb469a744e9bab6bc81f785b1d9feb6b69d')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
