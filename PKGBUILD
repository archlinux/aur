# Maintainer: callmetango
# Contributor:Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-purpose
pkgver=6.31.0
pkgrel=1
pkgdesc='Framework for providing abstractions to get the developers purposes fulfilled'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-purpose'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'hicolor-icon-theme'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-accounts-integration'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-notifications'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-qt-accounts-library'
)
makedepends=(
	'intltool'
	'qt6-tools'
	'sonic-frameworks-barcode'
	'sonic-frameworks-cmake-modules'
)
optdepends=(
	'kdeconnect: sharing to smartphone via KDE Connect'
	'telegram-desktop: sharing via Telegram'
	'sonic-bluetooth-runtime: sharing via Bluetooth'
	'sonic-frameworks-barcode: QR code plugin'
	'sonic-frameworks-qml-bridge: Nextcloud and YouTube plugins'
)
conflicts=(
	'purpose5<5.114.0-2'
	'purpose'
)
provides=('purpose')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d226ef5310101ae961c35733a6b71c792fcbe292a65c58bbca9f81e3cc2c25f7')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
