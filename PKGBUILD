# Maintainer: Ward Segers <w@rdsegers.be>
pkgname=qpasm
pkgver=1.4
pkgrel=2
pkgdesc="pseudo-assembler interpreter"
arch=("x86_64")
url="https://github.com/synio-wesley/qpasm"
license=('LGPL')
depends=("qt6-base" "qt6-svg")
makedepends=("cmake" "qt6-tools")
provides=("qpasm")
source=("https://github.com/synio-wesley/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("59c57a0862bd7f48df09d6e9cfc6e8c0684520edd48d8477cbe981c8a9f59ea69a2a7da0760ce1084a93afeb7832890e34728824e7d928950de0bc3012140ffc")
prepare() {
	cd "$pkgname-$pkgver"
	cd src

	cmake .
}

build() {
	cd "$pkgname-$pkgver"
	cd src

	make -j $((`nproc`+1))
}

package() {
	# Desktop entry
	install -Dm 644 ./../qpasm.desktop "$pkgdir"/usr/share/applications/qpasm.desktop

	cd "$pkgname-$pkgver"
	# Binary
	install -Dm 755 ./src/qpasm "$pkgdir"/usr/bin/qpasm
	# Icon
	install -Dm 644 ./src/img/qpasm.svg "$pkgdir"/usr/share/icons/qpasm.svg
}
