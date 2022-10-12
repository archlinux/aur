# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python'
pkgname=kuroko
pkgver=1.3.0
pkgrel=1
url=https://kuroko-lang.github.io
license=(custom:MIT)
arch=(x86_64)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuroko-lang/kuroko/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a20abc628ed3ebec031ed3d5ca113d880cfb897b65563f15443629bde513b20746fd36cdc6b2b11ca23a7c08efc4e1fcaa85622df192a62bc3b62868baf3eab0')

build () {
	make -C "${pkgname}-${pkgver}" prefix=/usr
}

check () {
	make -C "${pkgname}-${pkgver}" prefix=/usr test
}

package () {
	make -C "${pkgname}-${pkgver}" prefix=/usr DESTDIR="${pkgdir}" install
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
