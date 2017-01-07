# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=pcc-libs
pkgver=1.1.0
pkgrel=1
pkgdesc="Libraries for the Portable C Compiler"
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom:BSD')
source=("http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/${pkgname}-${pkgver}.tgz"
	"license")
sha512sums=('89d90f246300ab1da652f652c685756aa038017f5b7d57d050bb5c88e01e70b594ffaef8772230fbeb9461e07c5b1df60e85e550ec4717008159218d50c8697a'
            '53cd45a41e994f9825d50e0db415ab21960fc03a11cafdbe09b044e92c2d1f7e22c825be3e91f34dd767890cbb8f506f589d94aa1ac5abf8b16535464d4bc11b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr

	make CC=gcc
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -D -m0644 ../license "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
