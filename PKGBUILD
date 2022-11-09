# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=qvr
pkgver=4.0.1
pkgrel=3
pkgdesc='A library that makes writing Virtual Reality (VR) applications very easy'
arch=('x86_64')
url='https://marlam.de/qvr/'
license=('MIT')
depends=('qt6-base')
makedepends=('cmake')
source=(https://marlam.de/qvr/releases/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('9d306d013873354ec875d1433fe7648219b8e43d34dd510fc72d70b80eabae1049d155e5cf8f8a314f7aed0988bd34ce14cb266b84ff737b8e80cdbb2e5c0a52'
            'SKIP')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

build() {
	cmake -B build -S "$pkgname-$pkgver/libqvr" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=OFF

	make -C build -j $(nproc)
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
