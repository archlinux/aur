# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-idle-tracker
pkgver=6.31.0
pkgrel=1
pkgdesc='User activity monitoring framework for SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-idle-tracker'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'libx11'
	'libxcb'
	'libxext'
	'libxss'
	'qt6-base'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kidletime')
conflicts=('kidletime')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('91bcd85f10b690083413695c3199fd53ecf7c7a55266be508a18d528946a8ec4')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
