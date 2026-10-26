# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-qt-integration
pkgver=6.31.0
pkgrel=1
pkgdesc='Framework providing components to allow applications to integrate with a SonicDE Workspace'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-qt-integration'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-notifications'
	'sonic-frameworks-settings'
	'sonic-frameworks-widgets-addons'
)
makedepends=(
	'appstream-qt'
	'packagekit-qt6'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=(
	'appstream-qt: dependency resolving via AppStream'
	'packagekit-qt6: dependency resolving via AppStream'
)
provides=('frameworkintegration')
conflicts=('frameworkintegration')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5f6feb53310013f5a0daa7cef74732d4ae0ce57aae439a0ebe709d49de6134ae')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
