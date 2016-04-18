# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Submitter: Andreas Baumann <abaumann@yahoo.com>

pkgname=pcc
pkgver=1.1.0
pkgrel=1
pkgdesc="A Portable C Compiler"
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom:BSD')
depends=('pcc-libs')
conflicts=('pcc-cvs')
source=("http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/${pkgname}-${pkgver}.tgz"
	"license")
md5sums=('1c0f22440753075d64f9f2c6ed0e8278'
         '51f6cc02b26af53f26cfe87494ca5c87')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/pcc

	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}/usr/share/man/man1/cpp.1" "${pkgdir}/usr/share/man/man1/pcpp.1"
	install -D -m0644 ../license "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
