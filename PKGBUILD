# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-browser-integration
pkgver=6.8.0
pkgrel=1
pkgdesc='Components necessary to integrate browsers into SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-browser-integration'
license=('GPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-activities'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-file-metadata'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-purpose'
	'sonic-frameworks-settings'
	'sonic-frameworks-status-notification'
	'sonic-workspace'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('plasma-browser-integration')
conflicts=('plasma-browser-integration')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bcea627846cac1f046bb1df6de6e3802ba28bccdae26ea8107dc5b5af769299f')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DINSTALL_CHROME_MANIFEST=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
