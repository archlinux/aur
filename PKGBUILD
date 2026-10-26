# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-keyboard
pkgver=6.8.1.1
pkgrel=1
pkgdesc='Virtual keyboard for Qt-based desktops with SonicDE X11 integration'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-keyboard'
license=(
	'FSFAP'
	'GPL-3.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'libxkbcommon'
	'qt6-base'
	'qt6-declarative'
	'qt6-virtualkeyboard'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-interface-libraries'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('plasma-keyboard')
conflicts=('plasma-keyboard')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('aac41a90eebf0ef1460f3a8d7f14fd8f97bd3bbecd3a09c2fcba12d06c52fbee')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
