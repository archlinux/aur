# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python'
pkgname=kuroko
pkgver=1.4.0
pkgrel=1
url=https://kuroko-lang.github.io
license=(custom:MIT)
arch=(x86_64)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuroko-lang/kuroko/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e8eab140c0bd3ed057fb0e7a2e3998ccb5d5ed0d95ad084705a32ea4f6d66d8e01f356887f3ca8fc9f8082c3a5cabfc1422e62fc2c117c602f18dfbd5f72eca2')

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
