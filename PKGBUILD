# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=libraw19
pkgver=0.19.5
pkgrel=1
provides=("libraw=${pkgver}")
pkgdesc='A library for reading RAW files obtained from digital cameras (CRW/CR2, NEF, RAF, DNG, and others). Will never be upgraded past API 19.'
arch=('x86_64')
url='https://www.libraw.org/'
license=(
	'CDDL'
	'LGPL'
)
depends=(
	'jasper'
	'lcms2'
)
source=("https://www.libraw.org/data/LibRaw-${pkgver}.tar.gz")
sha256sums=('40a262d7cc71702711a0faec106118ee004f86c86cc228281d12d16da03e02f5')

build() {
	cd LibRaw-${pkgver}
	./configure --prefix=/usr \
		--disable-examples \
		--docdir=/usr/share/doc/${pkgname} \
		--includedir=/usr/include/libraw-${pkgver} \
		--disable-static
	 make
}

package() {
	cd LibRaw-${pkgver}
	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}"/usr/lib/{libraw{.a,_r.a,_r.so,.so},pkgconfig}
}
