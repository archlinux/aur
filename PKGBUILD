# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: Eric Waller <ewwaller@gmail.com>

pkgname=basic256-qt5
pkgver=2.0.99.10
pkgrel=1
pkgdesc="Educational BASIC programming environment (last Qt5 release, for systems without Qt6)"
arch=('i686' 'x86_64' 'pentium4')
url="http://www.basic256.org/"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-serialport' 'qt5-speech')
makedepends=('bison' 'flex')
makedepends_i686=('icu76')
makedepends_pentium4=('icu76')
provides=('basic256')
conflicts=('basic256')
source=(http://downloads.sourceforge.net/kidbasic/basic256_${pkgver}.orig.tar.gz
        "basic256.desktop")
sha256sums=('cceb8447dd64b778080c7cf7e995105f4890b94c774374f62c72cab86cfd11be'
            '601fe0147cc4b394e2c01afa20e371f7dffc9e7787ce9360ae0332545f6e62ec')

build () {
	cd "$srcdir/basic256-${pkgver}"
	qmake BASIC256.pro
	make
}

package () {
	cd "$srcdir/basic256-${pkgver}"
	install -m 755 -D basic256 "${pkgdir}/usr/bin/basic256"
	install -m 755 -D "$srcdir/basic256-$pkgver/resources/icons/basic256.png" "${pkgdir}/usr/share/icons/basic256.png"
	install -m 755 -D "$srcdir/basic256.desktop" "${pkgdir}/usr/share/applications/basic256.desktop"
	mkdir -p "${pkgdir}/usr/share/basic256/examples"
	cp -pr Examples/* "${pkgdir}/usr/share/basic256/examples"
	cp -pr Translations/* "${pkgdir}/usr/share/basic256/"
}
