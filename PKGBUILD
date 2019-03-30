# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
pkgname=doclifter
pkgver=2.19
pkgrel=1
pkgdesc="translate troff requests into docbook"
arch=('any')
url="http://www.catb.org/~esr/doclifter/"
license=('BSD')
depends=(python2)
install=
source=("http://www.catb.org/~esr/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	sed "s/\/env python$/\/env python2/" ${pkgname}-${pkgver}/doclifter > doclifter
	sed "s/\/bin\/python /\/bin\/python2 /" ${pkgname}-${pkgver}/manlifter > manlifter
	gzip < ${pkgname}-${pkgver}/doclifter.1 > doclifter.1
	gzip < ${pkgname}-${pkgver}/manlifter.1 > manlifter.1
	chmod +x doclifter
	chmod +x manlifter
}

package() {
	install -d $pkgdir/usr/bin
	install doclifter manlifter $pkgdir/usr/bin
	install -D ${pkgname}-${pkgver}/COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
	install -d $pkgdir/usr/share/man/man1
	install -D doclifter.1 manlifter.1 $pkgdir/usr/share/man/man1
}

