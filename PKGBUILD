pkgname='styx'
pkgdesc='Scanner and parser generator'
pkgver='2.0.1'
pkgrel='3'
license=('GPL' 'LGPL')
url='http://speculate.de'
source=("${url}/${pkgname}-${pkgver}.tar.gz")
arch=('x86_64' 'i686')
depends=('glibc')
sha256sums=('449371c58aa890a69e26ff5ba6c7ada650849d8122d4c012eb4cfc26bae3da46c4e37ae50abaa50cdcd7cec2d4d59252d6a29d253648b1f555a7d71de0aee8b4')
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
