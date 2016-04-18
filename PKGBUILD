# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=pcc-libs
pkgver=1.1.0
pkgrel=1
pkgdesc="Libraries for the Portable C Compiler"
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom:BSD')
conflicts=('pcc-libs-cvs')
source=("http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/${pkgname}-${pkgver}.tgz"
	"license")
md5sums=('360c157bbf6a7a931c4760ccf4ad704a'
         '51f6cc02b26af53f26cfe87494ca5c87')

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
