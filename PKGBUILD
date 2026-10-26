# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-internationalization
pkgver=6.31.0
pkgrel=1
pkgdesc='Advanced internationalization framework'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-internationalization'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'iso-codes'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
)
makedepends=(
	'doxygen'
	'python'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('python: to compile .ts files')
provides=('ki18n')
conflicts=('ki18n')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3ceea02ec3d8d705a65a29966c33309eb2de8f0cf3870a9a8dcde143710dc2a3')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
