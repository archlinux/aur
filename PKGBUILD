# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: gruenfron <https://aur.archlinux.org/account/gruenfron>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=2.0
pkgrel=1
pkgdesc='3D video player with multi-display support'
arch=('x86_64')
url='https://bino3d.org/'
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'qvr')
makedepends=('cmake' 'qt6-tools')
source=(https://bino3d.org/releases/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('5620c506f4de1a9aa7f21f0a23481c5174e7a6a47e6401a84d048dc87843249ef325e33ebc49790d405eb4697c3c571550b0e202f24e758c446ce8e4014f98b3'
            'SKIP')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=OFF

	make -C build -j $(nproc)
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
