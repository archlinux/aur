# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=cityofthieves-cli
pkgver=1.8
pkgrel=1
pkgdesc="City Of Thieves is a text adventure game after the English gamebook with the same name by Ian Livingstone."
arch=('any')
url="https://github.com/richelbilderbeek/CityOfThieves"
license=('GPL3')
makedepends=('qt5-base' 'make')
source=("https://github.com/richelbilderbeek/CityOfThieves/archive/v${pkgver}.tar.gz")
sha256sums=('98bcb1d3a61f6ca3174aee3e9b79144459825bb898f363ef3f65bbc40b320de4')

prepare() {
	cd "CityOfThieves-$pkgver"
	patch --forward --strip=1 --input="${startdir}/001-fix-qt-building.patch"
}

build() {
	cd "CityOfThieves-$pkgver"
	make console
}

check() {
	cd "CityOfThieves-$pkgver"
	make console_test
}

package() {
	# Binary
	install -Dm755 "${srcdir}/CityOfThieves-$pkgver/Console/CityOfThievesConsole" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/CityOfThieves-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
