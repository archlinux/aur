# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: Eric Waller <ewwaller@gmail.com>

pkgname=basic256
pkgver=1.1.4.0
pkgrel=1
pkgdesc="Educational BASIC programming environment"
arch=('i686 x86_64')
url="http://www.basic256.org/"
license=('GPL2')
depends=('qt5-base' 'qt5-multimedia' 'qt5-webkit' 'qt5-serialport' 'sdl_mixer' 'espeak')
makedepends=('bison' 'flex')
source=(http://downloads.sourceforge.net/kidbasic/${pkgname}_${pkgver}.orig.tar.gz
        "basic256.desktop")
md5sums=('f8792253652b44cfad1d5e41bce7e472'
         'dfb1ee3ac38d86549ed5673b8ee46b49')

build () {
	cd "$srcdir/${pkgname}-${pkgver}" || return 1
	qmake BASIC256.pro || return 1
	make || return 1
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
