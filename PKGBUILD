# Maintainer: Nimrod Maclomair <nimrod4garoa at gmail dot com>
pkgname=olsrd-git
pkgrel=1
pkgver=v0.9.7.r71.g4ef6d68e
pkgdesc='The olsr.org implementation of the Optimized Link State Routing Protocol.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://www.olsr.org/mediawiki/index.php/Olsrd'
license=('custom')
depends=()
optdepends=('gpsd')
makedepends=('bison' 'flex' 'gpsd')
source=("$pkgname"::'git+https://github.com/OLSR/olsrd.git'
		'olsrd.service')
sha256sums=('SKIP'
            '321f2e0d30af597a38442eb8f039757767efc5da88205b85cf96819384c94ac7')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
	cd $pkgname
	make prefix=/usr libdir=/usr/lib/olsrd sbindir=/usr/bin DESTDIR=${pkgdir} build_all
}

package(){
	
	cd $pkgname
	make prefix=/usr libdir=/usr/lib/olsrd sbindir=/usr/bin DESTDIR=${pkgdir} install_all

	mkdir --parents $pkgdir/usr/share/licenses/${pkgname}
	mkdir --parents $pkgdir/usr/lib/systemd/system
	
	cp license.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	cp ../olsrd.service $pkgdir/usr/lib/systemd/system/.
}
