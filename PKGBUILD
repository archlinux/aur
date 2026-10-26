# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-terminal
pkgver=26.08.2
pkgrel=1
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-terminal'
pkgdesc='SonicDE terminal emulator'
license=(
	'GPL-2.0-or-later'
	'LGPL-2.0-or-later'
)
depends=(
	'glibc'
	'icu'
	'libssh'
	'libstdc++'
	'libxkbcommon'
	'qt6-base'
	'qt6-multimedia'
	'sh'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-bookmarks'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notification-settings'
	'sonic-frameworks-notifications'
	'sonic-frameworks-pseudo-terminal'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-text-widgets'
	'sonic-frameworks-ui-components'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=('keditbookmarks: to manage bookmarks')
provides=('konsole')
conflicts=('konsole')
groups=(
	'sonicde-applications'
	'sonicde-utilities'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f07a6ae2b1e0320d59e4c555c72a45143d2b00654344aaab3d39d11188f1caf2')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
