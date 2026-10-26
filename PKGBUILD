# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-activities
pkgver=6.8.0
pkgrel=1
pkgdesc='Core components for SonicDE Activities'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-activities'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-settings'
)
makedepends=(
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('qt6-declarative: QML bindings')
provides=('plasma-activities')
conflicts=(
	'kactivities'
	'plasma-activities'
)
replaces=('kactivities')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ae13996b4ab82e9b0eae6f39d45dddbed8d3e4cb4f5a2c8aa634a3099b5dbf0a')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
