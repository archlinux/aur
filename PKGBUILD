# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-pseudo-terminal
pkgver=6.31.0
pkgrel=1
pkgdesc='Pty abstraction'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-pseudo-terminal'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'libutempter'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-internationalization'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kpty')
conflicts=('kpty')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0f61ac7a05a5d0382ebdef8b694bd5e29025de3b83cddd7dae96ba3f043f903a')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
