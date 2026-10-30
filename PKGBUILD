# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-network-manager
pkgver=6.8.0
pkgrel=2
pkgdesc='SonicDE applet written in QML for managing network connections'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-network-manager'
license=('GPL-2.0-or-later')
depends=(
	'glib2'
	'glibc'
	'libnm'
	'libstdc++'
	'openssl'
	'qcoro'
	'qt6-base'
	'qt6-declarative'
	'qtkeychain-qt6'
	'sonic-frameworks-app-info'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-barcode'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-modemmanager'
	'sonic-frameworks-networkmanager'
	'sonic-frameworks-notifications'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-charts'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-interface-libraries'
	'sonic-workspace'
)
makedepends=(
	'openconnect'
	'qt6-webengine'
	'sonic-frameworks-cmake-modules'
)
optdepends=(
	'openconnect: Cisco AnyConnect VPN plugin'
	'qrca: QR code scanner'
	'qt6-webengine: Cisco AnyConnect VPN plugin'
)
((USE_SYSTEMD)) || optdepends+=(
	'elogind: sleep and resume notifications through login1'
)
provides=('plasma-nm')
conflicts=('plasma-nm')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('007a3fc1d0138d1648648fe5a2440d3c92d243ef12f9a53dd5185afd4e9de4bf')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
