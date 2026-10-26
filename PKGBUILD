# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-gui-addons
pkgver=6.31.0
pkgrel=1
pkgdesc='Addons to QtGui'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-gui-addons'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'libx11'
	'qt6-base'
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
provides=('kguiaddons')
conflicts=('kguiaddons')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3b6b97b996b393ff693aa3f140c0dd31cb5fa8eca5e4695328cbc5b9824c000a')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
