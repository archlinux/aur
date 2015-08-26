# Maintainer: Kyle <kyle@gmx.ca>

pkgname=f3
pkgver=5.0
pkgrel=1
pkgdesc="Utilities to detect and repair counterfeit flash storage, i.e. thumb drives and memory cards with less flash than advertised"
arch=('i686' 'x86_64')
url="http://oss.digirati.com.br/f3/"
license=('GPL3')
depends=('parted')
conflicts=
provides=
source=(https://github.com/AltraMayor/${pkgname}/archive/v${pkgver}.zip)
md5sums=('15859fe7af53330985821b8c91a19fef')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
	make experimental
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -m 755 -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/man/man1
	install -m 755 f3brew f3fix f3probe f3read f3write log-f3wr ${pkgdir}/usr/bin/
install -m 644 f3read.1 ${pkgdir}/usr/share/man/man1/
	cd ${pkgdir}/usr/share/man/man1
	ln -s f3read.1 f3write.1
}
