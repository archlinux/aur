# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Dynamic, bytecode-compiled programming language and a dialect of Python'
pkgname=kuroko
pkgver=1.2.5
pkgrel=2
url=https://kuroko-lang.github.io
license=(custom:MIT)
arch=(x86_64)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuroko-lang/kuroko/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f9d1d595121f671586fe65ac94bb01fcd8e44668081b57f6a634d56f9d0f2978ba6217ccad0095cfd3a6effdec5b8d484888419075e6d02aa7cc741dcd88a72a')

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
