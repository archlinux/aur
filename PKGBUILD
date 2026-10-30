# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-file-search-ui
pkgver=6.8.0
pkgrel=2
pkgdesc='A dedicated search application for SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-file-search-ui'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-runner'
	'sonic-frameworks-settings'
	'sonic-frameworks-svg'
	'sonic-interface-libraries'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('milou')
conflicts=('milou')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7d9fd9d3fadddb62c56e1938dadf4522fc129a43d50963e7afb7a5f5df9ca9ab')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
