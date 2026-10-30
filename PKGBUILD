# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-bluetooth-runtime
pkgver=6.8.0
pkgrel=2
pkgdesc='Integrate Bluetooth within SonicDE components'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-bluetooth-runtime'
license=('GPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-app-info'
	'sonic-frameworks-bluetooth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-notifications'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-interface-libraries'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=(
	'bluez-obex: file transfer'
	'pulseaudio-bluetooth: to connect to A2DP profile'
)
((USE_SYSTEMD)) || optdepends+=(
	'elogind: sleep and resume notifications through login1'
)
provides=('bluedevil')
conflicts=('bluedevil')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('766387d75bc9a4ccc889e0f3bbc9fb8e4700dc502088b33d49fb12ad7f513cb4')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
