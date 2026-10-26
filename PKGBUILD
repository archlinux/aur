# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-silver-icons
pkgver=6.31.0
pkgrel=1
pkgdesc='Silver icon theme'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-silver-icons'
license=(
	'LGPL-3.0-or-later'
	'LGPL-2.1-only'
)
depends=(
	'glibc'
	'qt6-base'
)
makedepends=(
	'python-lxml'
	'sonic-frameworks-cmake-modules'
)
provides=('breeze-icons')
conflicts=('breeze-icons')
replaces=('sonic-frameworks-silver-icons')
options=('!debug')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('58a61e6c1c2508848a8c3a8703c46a1024d7b087d5bd30ca6c15eebdd8f6c59a')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBINARY_ICONS_RESOURCE=ON \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
