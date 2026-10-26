# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-autocomplete
pkgver=6.31.0
pkgrel=1
pkgdesc='Text completion helpers and widgets'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-autocomplete'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-settings'
	'sonic-frameworks-text-codec'
	'sonic-frameworks-widgets-addons'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kcompletion')
conflicts=('kcompletion')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('74da7d7cba14724d231a3709f829f2a006c408e02722f8f17ab3a2d970a47a07')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
