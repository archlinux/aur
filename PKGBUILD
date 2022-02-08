# Maintainer: Tobias Heider <me@tobhe.de>

pkgname=opencu
pkgver=2
pkgrel=0
pkgdesc="A minimalistic serial terminal emulator"
arch=('any')
url="https://github.com/tobhe/opencu"
license=('ISC')
depends=('glibc' 'libevent')
makedepends=('cmake')
provides=('cu')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/tobhe/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('84e74f95dd8b5e281a0220d12310988d74fd2a7e45b9a7f6e6a2432cc73e9c13')

build() {
	cd $pkgname-$pkgver
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm644 cu.1 "${pkgdir}"/usr/share/man/man1/cu.1

	cd build
	install -Dm755 cu "${pkgdir}"/usr/bin/cu
}
