# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-svg
pkgver=6.31.0
pkgrel=1
pkgdesc='Components for handling SVGs'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-svg'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-svg'
	'sonic-frameworks-archive'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-settings'
)
makedepends=(
	'doxygen'
	'qt6-declarative'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-quick-ui'
)
optdepends=(
	'qt6-declarative: QML bindings'
	'sonic-frameworks-quick-ui: QML bindings'
)
provides=('ksvg')
conflicts=('ksvg')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f691a555307f48f020c272480b75edde3f527457fbb1b0187bfbaf2347576f64')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
