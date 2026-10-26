# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-polkit-agent
pkgver=6.8.0
pkgrel=1
pkgdesc='Daemon providing a polkit authentication UI for SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-polkit-agent'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-notifications'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-windowsystem'
	'sonic-polkit'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('polkit-kde-agent')
conflicts=('polkit-kde-agent')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2085cf4bbc40bc787191c9f53a635ce24530e384571f8a74374ac78d0c63f311')

build() {
	cmake -B build -S $pkgname-$pkgver \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
