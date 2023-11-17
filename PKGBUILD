pkgname='styx'
pkgdesc='Scanner and parser generator'
pkgver='2.0.1'
pkgrel='4'
license=('GPL' 'LGPL')
url='http://speculate.de'
source=("${url}/${pkgname}-${pkgver}.tar.gz")
arch=('x86_64' 'i686')
depends=('glibc')
sha256sums=('f370319fe87ce5c61dfad2bb36ecd6574b3af13f314e1b580e1ec1bfabea0086')
b2sums=('26a72dcb400e9fa68d639b83c3222cc2a7753d6e6dac7c0bbc79fe83bff1e61ecba39e5662a35f5e89791f5da5cb205fe7dac9932f010128e26c36431ff2a6fe')

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --includedir=/usr/include/styx
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}/usr/share/doc" \
	   "${pkgdir}/usr/share/styx"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	mv "${pkgdir}/usr/share/examples" \
	   "${pkgdir}/usr/share/doc/${pkgname}/"
	mv "${pkgdir}/usr/share/styx"/* \
	   "${pkgdir}/usr/share/doc/${pkgname}/"
	rmdir "${pkgdir}/usr/share/styx"
}
