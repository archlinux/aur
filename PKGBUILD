# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-notifications
pkgver=6.31.0
pkgrel=1
pkgdesc='Abstraction for system notifications'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-notifications'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libcanberra'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-settings'
)
makedepends=(
	'doxygen'
	'python-build'
	'python-setuptools'
	'qt6-declarative'
	'sonic-frameworks-cmake-modules'
	'sonic-pyside6'
	'sonic-shiboken6-generator'
)
optdepends=(
	'qt6-declarative: QML bindings'
	'sonic-pyside6: Python bindings'
)
provides=('knotifications')
conflicts=('knotifications')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1d10c4fa7079dfbb41eb69e963c521c7c24e2cb82ebc94154c2c81623251e9a8')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
