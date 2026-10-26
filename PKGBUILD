# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-accounts-integration
pkgver=26.08.2
pkgrel=1
pkgdesc='Online account management system and its SonicDE integration components'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-accounts-integration'
license=('GPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'signon-kwallet-extension'
	'signon-plugin-oauth2'
	'signon-ui'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keyring'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-sso'
	'sonic-qt-accounts-library'
)
optdepends=('qt6-declarative: QML plugin')
makedepends=(
	'qcoro'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('kaccounts-integration')
conflicts=('kaccounts-integration')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7a40aa20c7a18516bd6f5bf46936075d9968f3b64366561d5e252a933b747e9e')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
