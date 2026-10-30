# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-screen
pkgver=6.8.0
pkgrel=2
pkgdesc='SonicDE screen management software'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-screen'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libx11'
	'libxcb'
	'libxi'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-image-formats'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-windowsystem'
	'sonic-interface-libraries'
	'sonic-plasma5-support-library'
	'sonic-screen-library'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('kscreen')
conflicts=('kscreen')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('18b84570b7a1d40e43a0f2f91887814e14328a0f1a200b8d799aca56d10baefe')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
