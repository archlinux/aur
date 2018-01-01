# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
pkgname=doclifter
pkgver=2.17
pkgrel=1
pkgdesc="translate troff requests into docbook"
arch=('any')
url="http://www.catb.org/~esr/doclifter/"
license=('BSD')
depends=(python2)
install=
source=(.AURINFO "http://www.catb.org/~esr/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('947b7c74d13169d2d6d808483271d5054f2b753014828cc1d626a09dbc9e9373'
            '27d2c8df3f2a199389a3baff65378c85bff14132a9026a514da5d00d65b58725')

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

