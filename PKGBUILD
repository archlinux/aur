# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-workspace-addons
pkgver=6.8.0
pkgrel=2
pkgdesc='All kind of addons to improve your SonicDE experience'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-workspace-addons'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'icu'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-quick3d'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-holidays'
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
	'sonic-frameworks-runner'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-spell-check'
	'sonic-frameworks-svg'
	'sonic-frameworks-unit-conversion'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
	'sonic-interface-libraries'
	'sonic-win'
	'sonic-workspace'
)
makedepends=(
	'qt6-webengine'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-networkmanager'
)
optdepends=(
	'qt6-webengine: dictionary and webbrowser applets'
	'quota-tools: disk quota applet'
	'sonic-frameworks-networkmanager: POTD wallpaper'
)
((USE_SYSTEMD)) || optdepends+=(
	'elogind: login1 sleep and resume notifications'
)
provides=('kdeplasma-addons')
conflicts=('kdeplasma-addons')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8dea587ca5528d60618caed972445afd94aef4a53bf2aa2e67d4fbf762400123')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
