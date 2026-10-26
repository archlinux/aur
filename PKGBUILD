# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-unit-conversion
pkgver=6.31.0
pkgrel=1
pkgdesc='Support for unit conversion'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-unit-conversion'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-internationalization'
)
makedepends=(
	'doxygen'
	'python-build'
	'python-setuptools'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-pyside6'
	'sonic-shiboken6-generator'
)
optdepends=('sonic-pyside6: Python bindings')
provides=('kunitconversion')
conflicts=('kunitconversion')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a7d7f4d7530720d26b8cc28cfa7b4c38da0d33025baf77c3f9f79a8c1725ffd3')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
