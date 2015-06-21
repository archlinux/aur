# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=dirb
pkgver=2.22
_name=dirb222
pkgrel=1
pkgdesc="DIRB is a web content scanner, brute forceing for hidden files"
url="http://dirb.sourceforge.net/"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('curl')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${_name}.tar.gz")
sha512sums=('57305160b11be9d48b44ece5848a102ab7a493a7ac30a44c31339fd7ca659866521ba621dc0639dc28bf21c3b5315390b934441590dac7d5b463e68df4b80b81')
build () {
	chmod -R 750 "${srcdir}"
	cd "${srcdir}/${_name}"
	./configure --prefix=/usr
	make
}
package() {
	cd "${srcdir}/${_name}"
	make DESTDIR="${pkgdir}" install
	mkdir -p "${pkgdir}/usr/share/${pkgname}/"
	cp -r "${srcdir}/${_name}/wordlists" "${pkgdir}/usr/share/${pkgname}/"
	# Avoid file conflict with icu
	mv "${pkgdir}/usr/bin/gendict" "${pkgdir}/usr/bin/gendict_dirb"
	chmod -R 755 "${pkgdir}/usr/share/${pkgname}/wordlists"
}
