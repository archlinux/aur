# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-runner
pkgver=6.31.0
pkgrel=1
pkgdesc='Framework for providing different actions given a string query'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-runner'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-settings'
	'sonic-frameworks-windowsystem'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('krunner')
conflicts=('krunner')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('16d64b45897bf598b9dc794f13c0329b1c72760c8549573e9c3e4d1745009f5d')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
