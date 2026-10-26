# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-activities-stats
pkgver=6.8.0
pkgrel=1
pkgdesc='A library for accessing the usage data collected by the activities system'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-activities-stats'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-activities'
	'sonic-frameworks-settings'
)
makedepends=(
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
conflicts=(
	'kactivities-stats'
	'plasma-activities-stats'
)
replaces=('kactivities-stats')
provides=('plasma-activities-stats')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('57dfdb36c3410b89da143df982579a0f50a394b03de9408687083383991b89a8')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
