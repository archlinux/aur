# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Submitter: Andreas Baumann <abaumann@yahoo.com>

pkgname=pcc
pkgver=1.1.0
pkgrel=1
pkgdesc="A Portable C Compiler"
arch=('x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom:BSD')
depends=('pcc-libs')
source=("http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/${pkgname}-${pkgver}.tgz"
	"license")
sha512sums=('5bd2b59fbb323016d215023ce77793ae66766e8e8192b44bf0707ee444658022e1645669c13eea8c81bc55c161eea3b0271d6b3098b8a7d51ce67eb86c7527b4'
            '53cd45a41e994f9825d50e0db415ab21960fc03a11cafdbe09b044e92c2d1f7e22c825be3e91f34dd767890cbb8f506f589d94aa1ac5abf8b16535464d4bc11b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export CFLAGS+=" -fcommon "

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
