# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=cityofthieves-cli
pkgver=1.2
pkgrel=1
pkgdesc="City Of Thieves is a text adventure game after the English gamebook with the same name by Ian Livingstone."
arch=('any')
url="https://github.com/richelbilderbeek/CityOfThieves"
license=('GPL3')
makedepends=('qt5-base')
source=("https://github.com/richelbilderbeek/CityOfThieves/archive/v${pkgver}.tar.gz")
md5sums=('7ee7d1de1cbd9f40e505425e62c19f34')

prepare() {
	cd "CityOfThieves-$pkgver"
	patch --forward --strip=1 --input="../../001-fix-qt-building.patch"
}

build() {
	cd "CityOfThieves-$pkgver"
	./build_console
}

package() {
	# Binary
	install -Dm755 "${srcdir}/CityOfThieves-$pkgver/Console/CityOfThievesConsole" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/CityOfThieves-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
