# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-keybind-daemon
pkgver=6.8.0
pkgrel=1
pkgdesc='Daemon providing Global Keyboard Shortcut (Accelerator) functionality'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-keybind-daemon'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libx11'
	'libxcb'
	'qt6-base'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-windowsystem'
	'xcb-util-keysyms'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('kglobalacceld')
conflicts=('kglobalacceld')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f4aa25e127791fcc788b7d54ca437090aa19d2d17582225aae26d383ad9358da')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
