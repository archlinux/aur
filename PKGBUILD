# Maintainer: Sematre <sematre at gmx dot de>
pkgname=mklittlefs
pkgver=3.0.0
pkgrel=1

pkgdesc="Utility for creating littlefs for upload on the ESP8266."
arch=('x86_64')
url="https://github.com/earlephilhower/${pkgname}"
license=('MIT')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

prepare() {
	cd "${pkgname}"
	git checkout "tags/${pkgver}"
	git submodule update --init
}

build() {
	cd "${pkgname}"
	make dist SKIP_TESTS=1 # Skip the tests, because there are no
}

package() {
	cd "${pkgname}"
	install -Dm 755 "${pkgname}" -t "$pkgdir/usr/bin"
	install -Dm 644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
