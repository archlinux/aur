# Maintainer: Luiz Henrique Laurini <luizhenriquelaurini at gmail dot com>
pkgname=textar
pkgver=0.1.0
pkgrel=1
pkgdesc="tar-like program for creating plain text archives from plain text files"
arch=('x86_64')
url="https://github.com/LHLaurini/textar"
license=('MIT')
makedepends=('cmake')
options=()
source=(https://github.com/LHLaurini/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('6596b17e3c72434b6bd60c5e2e3a3a0f')

build()
{
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build .
}

check()
{
	cd "$pkgname-$pkgver/build/tests"
	ctest
}

package()
{
	cd "$pkgname-$pkgver/build"
	DESTDIR=$pkgdir cmake --build . --target install
}

