# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname='rastertoezpl'
pkgver=1.1.2
pkgrel=1
pkgdesc='CUPS driver for GODEX printers'
arch=('i686' 'x86_64')
depends=('cups')
url="http://www.godexintl.com"
license=('GPL-2')
source=("rastertoezpl-${pkgver}.tar.gz::http://www.godexintl.com/en/download/downloads/Download/5597") ;
md5sums=('2a918a782cdc3bb176a06e0748cb0cb8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --libexecdir=/usr/lib/cups/filter
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

	cd "${pkgdir}/usr/lib/cups/filter"
	mv rastertoezpl rastertoezpl.dir
	mv rastertoezpl.dir/rastertoezpl .
	rmdir rastertoezpl.dir
}
