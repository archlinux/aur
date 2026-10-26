# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-exiv2-library
pkgver=26.08.2
pkgrel=1
pkgdesc='A library to manipulate pictures metadata'
url='https://github.com/Sonic-DE/sonic-exiv2-library'
arch=('x86_64')
license=(
	'GPL-2.0-or-later'
	'LGPL-2.0-or-later'
)
depends=(
	'exiv2'
	'glibc'
	'libgcc'
	'libstdc++'
	'qt6-base'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('libkexiv2')
conflicts=('libkexiv2')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cc2135570f0649a5ec3e2d03663470674ae9822d50419cca97891d5f15a3cfb8')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
