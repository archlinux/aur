# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=qmicroz
pkgver=0.4
pkgrel=2
pkgdesc="C++/Qt wrapper over miniz. Zip/Unzip with Qt."
arch=('x86_64')
url="https://github.com/artemvlas/qmicroz"
license=('MIT')
depends=('qt6-base')
makedepends=('cmake')

source=(https://github.com/artemvlas/qmicroz/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(5f8f86916402f32d359fc23c9d2133194b9b74511e6ac6afb0041cb4ddeb5af8)

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 src/qmicroz.h "${pkgdir}/usr/include/qmicroz.h"
	cd build
	make install DESTDIR="${pkgdir}"
}
