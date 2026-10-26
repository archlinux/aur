# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-progress-ui
pkgver=6.31.0
pkgrel=1
pkgdesc='Widgets for tracking KJob instances'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-progress-ui'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-notifications'
	'sonic-frameworks-widgets-addons'
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
provides=('kjobwidgets')
conflicts=('kjobwidgets')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('82a2d7957583ff741963d646caf7be7b89eae74bfa9a8bf7a3bef9e65e2fcac4')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
