# Maintainer: another <code § deadcode § eu>
# Contributor: (unknown)
pkgname=bitmap
pkgver=1.0.9
pkgrel=1
pkgdesc="X-bitmap (XBM) editor and converter utilities"
arch=('i686' 'x86_64')
url="http://www.x.org/"
license=('MIT')
depends=('libxaw>=1.0.7')
makedepends=('xbitmaps')
source=("https://ftp.x.org/pub/individual/app/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4b5f058a54bc6c831482320fab374bf5d729356ac8277f0e45e9080079d9eb4f')
sha512sums=('4b8c89ecf6456609b497d3fab62d848e65d3b61dfa49b5761acfae8675c3ab8dc49a9f35a807796388b46fbc68b4cc0ab3422240ebd6e61e9543c8c5e89fd566')

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
	install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

	# conflicts with 'mesa-demos'
	mv "${pkgdir}/usr/bin/bitmap" "${pkgdir}/usr/bin/bitmap-xorg"
}
