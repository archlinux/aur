# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-core-addons
pkgver=6.31.0
pkgrel=1
pkgdesc='Addons to QtCore'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-core-addons'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libgcc'
	'libstdc++'
	'libudev.so'
	'qt6-base'
	'util-linux-libs'
)
makedepends=(
	'doxygen'
	'python-build'
	'python-setuptools'
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-pyside6'
	'sonic-shiboken6-generator'
)
optdepends=(
	'qt6-declarative: QML bindings'
	'sonic-pyside6: Python bindings'
)
provides=('kcoreaddons')
conflicts=('kcoreaddons')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fd8297c46f64c55e856c1a31d3380ad7167a9e01c03af5eeecb1d27b1ac8fd2d')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
