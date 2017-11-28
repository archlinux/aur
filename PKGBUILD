# Maintainer: Nimrod Maclomair <nimrod4garoa at gmail dot com>
pkgname=olsrd
pkgrel=1
pkgver=0.9.6.2
pkgdesc='The olsr.org implementation of the Optimized Link State Routing Protocol.'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.olsr.org/mediawiki/index.php/Olsrd'
license=('custom')
depends=()
optdepends=('gpsd')
makedepends=('bison' 'flex' 'gpsd')
source=('https://github.com/OLSR/olsrd/archive/v0.9.6.2.tar.gz'
		'olsrd.service')
sha256sums=('e1e2c1eb4f05fa737bc96fe49c9596984d4059f5209a7149f0a23ac54b99934e'
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
