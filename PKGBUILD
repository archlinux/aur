# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-thunderbolt
pkgver=6.8.0
pkgrel=1
pkgdesc='SonicDE integration for controlling Thunderbolt devices'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-thunderbolt'
license=('LGPL-2.0-or-later')
depends=(
	'bolt'
	'glibc'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-notifications'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings-utils'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('plasma-thunderbolt')
conflicts=('plasma-thunderbolt')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('634ef4982e5e2d104c9f46ae7f570a82da18b31ab3663a3eb7c2ad6e4ba68278')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
