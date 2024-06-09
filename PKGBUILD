# Maintainer: Manuel Hüsers <aur@huesers.de>

pkgname=qvr
pkgver=4.0.2
pkgrel=1
pkgdesc='A library that makes writing Virtual Reality (VR) applications very easy'
arch=('x86_64')
url='https://marlam.de/qvr/'
license=('MIT')
depends=('qt6-base')
makedepends=('cmake')
source=(https://marlam.de/qvr/releases/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('9c973ee15f87026ef30dabc7a1cabcaac7cf2cfce8720434935db136e0352c749b448fc1036dd8242dc124c28d596aea13b3fd43840adbf330c892e2dffabc69'
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
