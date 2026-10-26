# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=sonic-qt-theme-bridge
pkgver=6.8.0
pkgrel=1
pkgdesc='Qt Platform Theme integration plugins for the SonicDE workspaces'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-qt-theme-bridge'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libxcb'
	'libxcursor'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-app-info'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-quick-desktop-style'
	'sonic-frameworks-quick-silver-style'
	'sonic-frameworks-settings'
	'sonic-frameworks-status-notification'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('plasma-integration')
conflicts=('plasma-integration')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7d1b169c9845c0bc01f7c3a44957da4cefc5c982164deaf43735f1341472576b')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF \
		-DBUILD_QT5=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
