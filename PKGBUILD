# Maintainer: Nimrod Maclomair <nimrod4garoa at gmail dot com>
pkgname=olsrd
pkgrel=2
pkgver=0.9.0.3
pkgdesc='The olsr.org implementation of the Optimized Link State Routing Protocol.'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.olsr.org/mediawiki/index.php/Olsrd'
license=('custom')
depends=()
makedepends=('bison' 'flex')
source=('https://github.com/OLSR/olsrd/archive/v0.9.0.3.tar.gz'
		'olsrd.service')
sha256sums=('1b1a64e73109d8bfbc8cc10432baaca6f6da9adddade196b7f8caa5f01f86e09'
            '321f2e0d30af597a38442eb8f039757767efc5da88205b85cf96819384c94ac7')

build(){
	cd $pkgname-$pkgver
	make prefix=/usr libdir=/usr/lib/olsrd sbindir=/usr/bin DESTDIR=${pkgdir} build_all
}

package(){
	
	cd $pkgname-$pkgver
	make prefix=/usr libdir=/usr/lib/olsrd sbindir=/usr/bin DESTDIR=${pkgdir} install_all

	mkdir --parents $pkgdir/usr/share/licenses/${pkgname}
	mkdir --parents $pkgdir/usr/lib/systemd/system
	
	cp license.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	cp ../olsrd.service $pkgdir/usr/lib/systemd/system/.
}
