# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-file-search
pkgver=6.31.0
pkgrel=1
pkgdesc='A framework for searching and managing metadata'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-file-search'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'lmdb'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-file-metadata'
	'sonic-frameworks-idle-tracker'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-settings'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=('qt6-declarative: QML bindings')
provides=('baloo')
conflicts=(
	'baloo'
	'baloo5'
)
replaces=('baloo5')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ae80d7edba8b2cc0b8a82eabcd862cf7bc41e76d9a0acee82c872d121f9e33bc')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
