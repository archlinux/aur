# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=xdg-desktop-portal-sonicde
pkgver=6.8.0
pkgrel=1
pkgdesc='X11 backend for xdg-desktop-portal using SonicDE and Qt'
arch=('x86_64')
url='https://github.com/Sonic-DE/xdg-desktop-portal-sonicde'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libei'
	'libstdc++'
	'libxkbcommon'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-views'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-io-fuse'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notifications'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-status-notification'
	'sonic-frameworks-windowsystem'
	'sonic-pipewire'
	'sonic-workspace' # QML
	'xcb-util'
	'xcb-util-image'
	'xcb-util-renderutil'
	'xcb-util-wm'
	'xdg-desktop-portal'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=(
	'xdg-desktop-portal-impl'
	'xdg-desktop-portal-kde'
)
conflicts=('xdg-desktop-portal-kde')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('55b22d3cecdca7bc018d972324aef052b0c8583b3cd86928fca6bc9f4cb798b3')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
