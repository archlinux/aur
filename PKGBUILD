# Maintainer: callmetango
# Contributor:Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-drawing-tablet
pkgver=6.8.0
pkgrel=2
pkgdesc='GUI for Wacom Linux drivers that supports different button/pen layout profiles'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-drawing-tablet'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libwacom'
	'libxcb'
	'libxi'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notifications'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
	'sonic-interface-libraries'
	'sonic-plasma5-support-library'
	'xf86-input-wacom'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('wacomtablet')
conflicts=(
	'kcm-wacomtablet'
	'wacomtablet'
)
replaces=('kcm-wacomtablet')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('42a2af80c784b13f5de36030a6dfc2496d61d1ecfeb65b28be3e797bb75caf0b')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
