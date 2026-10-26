# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-win
pkgver=6.8.0.2
pkgrel=1
pkgdesc='An easy to use, but flexible, X Window Manager'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-win'
license=('LGPL-2.0-or-later')
depends=(
	'aurorae'
	'glibc'
	'lcms2'
	'libcanberra'
	'libdisplay-info'
	'libdrm'
	'libepoxy'
	'libgcc'
	'libqaccessibilityclient-qt6'
	'libstdc++'
	'libx11'
	'libxcb'
	'libxi'
	'libxkbcommon'
	'libxkbcommon-x11'
	'mesa'
	'qt6-base'
	'qt6-declarative'
	'qt6-sensors'
	'qt6-svg'
	'qt6-tools'
	'sonic-activities'
	'sonic-decoration'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notifications'
	'sonic-frameworks-package'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-charts'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
	'sonic-interface-libraries'
	'sonic-keybind-daemon'
	'sonic-night-light'
	'sonic-screenlocker'
	'sonic-silver'
	'xcb-util-cursor'
	'xcb-util-keysyms'
	'xcb-util-wm'
)
makedepends=(
	'python'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
((USE_SYSTEMD)) || optdepends=(
	'elogind: login1 session management'
	'esettingsd: locale1 service for dinit, runit or s6'
	'openrc-settingsd: locale1 service for OpenRC'
)
provides=('kwin-x11')
conflicts=('kwin-x11')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
install="$pkgname.install"
sha256sums=('fcd4d0165b415a0e47e664d8d227967c8c5726bbee37c2716eedd2228651a8e8')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
