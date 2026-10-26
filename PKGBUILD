# Maintainer: callmetango
# Contributor:Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-gamma
pkgver=6.8.0
pkgrel=1
pkgdesc='Adjust your monitor gamma settings'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-gamma'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libx11'
	'libxxf86vm'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
conflicts=(
	'kgamma'
	'kgamma5'
)
replaces=('kgamma5')
provides=('kgamma')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a537fabeeb80f3ac466c16e27eef227022d6cec3a1339c116160a13388dc9687')

build() {
	cmake -B build  -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
