# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-status-notification
pkgver=6.31.0
pkgrel=1
pkgdesc='Implementation of Status Notifier Items'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-status-notification'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-windowsystem'
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
provides=('kstatusnotifieritem')
conflicts=('kstatusnotifieritem')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6ea0443ea0fd30b9cd5a1f948461071d19b0b4d5b18bf86aa38a8ff4e85762ea')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
