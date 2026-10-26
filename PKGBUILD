# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-networkmanager
pkgver=6.31.0
pkgrel=1
pkgdesc='Qt wrapper for NetworkManager API'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-networkmanager'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'networkmanager'
	'qt6-base'
)
makedepends=(
	'doxygen'
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('qt6-declarative: QML bindings')
provides=('networkmanager-qt')
conflicts=('networkmanager-qt')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3dfa087535eadc7a9e43d4b9d99dcd77370b55915b92ead85634ec190b27720f')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
