# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-keyring
pkgver=6.31.0
pkgrel=1
pkgdesc='Secure and unified container for user passwords'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-keyring'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glib2'
	'glibc'
	'gpgmepp'
	'libgcc'
	'libgcrypt'
	'libsecret'
	'libstdc++'
	'qca-qt6'
	'qt6-base'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-notifications'
	'sonic-frameworks-settings'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-app-info'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=('kwalletmanager: Configuration GUI')
provides=(
	'kwallet'
	'org.freedesktop.secrets'
)
conflicts=('kwallet')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cb14ce3aa35193377834f8ffae19f934cee2da619432e7a3b5e84c3e53cdec4b')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	# Fix conflicts for now
	rm "$pkgdir"/usr/share/dbus-1/services/org.kde.kwalletd5.service
}
