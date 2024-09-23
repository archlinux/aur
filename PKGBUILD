# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=qvr
pkgver=4.1.0
pkgrel=1
pkgdesc='A library that makes writing Virtual Reality (VR) applications very easy'
arch=('x86_64')
url='https://marlam.de/qvr/'
license=('MIT')
depends=('qt6-base')
makedepends=('cmake')
source=(https://marlam.de/qvr/releases/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('609b706f06d21668db85dbdc282a1b86931ba380c0044e2918bbcd11903748ccc83579d9790dcf372ea8ebc7c86daa6810f12a43b8d7fc941b32b17f34c0b716'
            'SKIP')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

build() {
	cmake -B build -S "$pkgname-$pkgver/libqvr" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=OFF

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
