# Maintainer: Sematre <sematre at gmx dot de>
pkgname=mklittlefs
pkgver=3.1.0
pkgrel=1

pkgdesc="Utility for creating littlefs for upload on the ESP8266."
arch=('x86_64')
url="https://github.com/earlephilhower/${pkgname}"
license=('MIT')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=${pkgver}"
        "littlefs::git+https://github.com/littlefs-project/littlefs.git")
md5sums=('SKIP'
         'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"

	git submodule init
	git config submodule.littlefs.url "${srcdir}/littlefs"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "${srcdir}/${pkgname}"

	make dist SKIP_TESTS=1 # Skip the tests, because there are no
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm 755 "${pkgname}" -t "$pkgdir/usr/bin"
	install -Dm 644 "LICENSE.txt"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
