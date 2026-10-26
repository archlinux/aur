# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-system-info
pkgver=6.8.0
pkgrel=1
pkgdesc='A utility that provides information about a computer system'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-system-info'
license=('LGPL-2.0-or-later')
depends=(
	'aha'
	'clinfo'
	'dmidecode'
	'glibc'
	'glu'
	'iproute2' # ip
	'libdisplay-info'
	'libdrm'
	'libpulse' # pactl
	'libstdc++'
	'libudev.so'
	'libusb'
	'lm_sensors'
	'mesa-utils'
	'qt6-base'
	'qt6-declarative'
	'sh'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-system-settings'
	'vulkan-tools'
	'wayland-utils'
	'xorg-xdpyinfo'
)
makedepends=(
	'fwupd'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
	'vulkan-headers'
)
optdepends=(
	'fwupd: firmware security module'
	'sonic-disks: SMART devices health monitor'
)
provides=('kinfocenter')
conflicts=('kinfocenter')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2cb71d6190a618bd08180a12698db57a9cfc65dedf30121288dfc03a669dae6a')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
