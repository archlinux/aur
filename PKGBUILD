# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: Eric Waller <ewwaller@gmail.com>

pkgname=basic256
pkgver=1.1.4.0
pkgrel=3
pkgdesc="Educational BASIC programming environment"
arch=('i686' 'x86_64')
url="http://www.basic256.org/"
license=('GPL2')
depends=('qt5-base' 'qt5-multimedia' 'qt5-webkit' 'qt5-serialport' 'sdl_mixer' 'espeak')
makedepends=('bison' 'flex')
source=(http://downloads.sourceforge.net/kidbasic/${pkgname}_${pkgver}.orig.tar.gz
        "basic256.desktop")
sha256sums=('9df3ac4535448c1bd721364829e1bf4df7087c9b2c8d789e1fb5903e58c043ba'
            '601fe0147cc4b394e2c01afa20e371f7dffc9e7787ce9360ae0332545f6e62ec')

build () {
	cd "$srcdir/${pkgname}-${pkgver}" 
	qmake BASIC256.pro 
	make 
}

package () {
        cd "$srcdir/${pkgname}-${pkgver}"
	install -m 755 -D basic256 "${pkgdir}/usr/bin/basic256"
	install -m 755 -D Examples/basic256_icon.png "${pkgdir}/usr/share/icons/basic256.png"
	install -m 755 -D "$srcdir/basic256.desktop" "${pkgdir}/usr/share/applications/basic256.desktop"
	mkdir -p "${pkgdir}/usr/share/basic256/examples"
	cp -pr Examples/* "${pkgdir}/usr/share/basic256/examples"
        mkdir -p "${pkgdir}/usr/share/basic256/help"
        cp -pr wikihelp/help/* "${pkgdir}/usr/share/basic256/help"
        cp -pr Translations/* "${pkgdir}/usr/share/basic256/"
}

