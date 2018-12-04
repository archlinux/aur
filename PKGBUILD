# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
pkgname=doclifter
pkgver=2.18
pkgrel=1
pkgdesc="translate troff requests into docbook"
arch=('any')
url="http://www.catb.org/~esr/doclifter/"
license=('BSD')
depends=(python2)
install=
source=(.AURINFO "http://www.catb.org/~esr/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('03e9ab825876fa602f3882ef680317dedd2cf2c90f3e24bcf6d6e5a7f3c0c7ab'
            'ce95fedd0a3ace1468e7b50645dd5970872c7216197a40dac3a9ff5856a4f36b')

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

