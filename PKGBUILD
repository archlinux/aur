# Maintainer: Jonathan <jonathan.625266@earthlink.net>

pkgname=esniper-cvs
pkgver=2.33.0
pkgrel=1
pkgdesc="esniper: a lightweight eBay sniping tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://esniper.sourceforge.net"
license=('BSD')
provides=('esniper')
depends=('curl' 'openssl')
makedepends=('cvs')
conflicts=('esniper')

prepare() {
        cvs -z3 -d:pserver:anonymous@esniper.cvs.sourceforge.net:/cvsroot/esniper co -P esniper
	rm -rf $srcdir/build
	cp -ar $srcdir/esniper $srcdir/build
}

pkgver() {

        cd $srcdir/esniper
	cat version.txt
}

build() {        
        cd $srcdir/build
        ./configure --prefix=/usr
	make
}

package() {		
        cd $srcdir/build
        make DESTDIR="${pkgdir}" install
        install -d "${pkgdir}/usr/share/doc/${_pkgname}"
        install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
