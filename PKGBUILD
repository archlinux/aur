# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=nmead
pkgver=01.03.00
pkgrel=2
pkgdesc='Service that distributes NMEA data over the network'
arch=('i686' 'x86_64' 'arm')
url='http://home.hiwaay.net/~taylorc/gps/nmea-server/'
license=('GPL3')
source=(http://home.hiwaay.net/~taylorc/gps/nmea-server/nmead.src.01.03.00.tar.gz
	nmead-01.03.00-makefile.patch nmead-01.03.00-115200.patch nmead-01.03.00-trigraphs.patch nmead-01.03.00-types.patch
	nmead.service nmead.script nmead.conf)
backup=('etc/conf.d/nmead')
md5sums=('80274744764fc637b08d3d67bf9f9ad0'
         '83a2bbc8c38f4c2c958b5dfe42202b0b'
         '912367456b0d1c0ac1c67b1e1b0cf965'
         '7488313dc8784679c54566d97a1b815a'
         'f9c39c6f53dd625093f93ae48566e847'
         '9bc23011a395f6e64623b2c7f72a6da0'
         '3a7158004de6513c79afae9bf51c9ef7'
         '3a4e6ccd40b93e27038e1a67849f06b7')

prepare() {
	patch -p0 -i nmead-01.03.00-makefile.patch
	patch -p0 -i nmead-01.03.00-115200.patch
	patch -p0 -i nmead-01.03.00-trigraphs.patch
	patch -p0 -i nmead-01.03.00-types.patch
}

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	install -m755 -D $pkgname-$pkgver/nmead "$pkgdir/usr/bin/nmead"
	install -m644 -D nmead.service $pkgdir/usr/lib/systemd/system/nmead.service
	install -m755 -D nmead.script  $pkgdir/usr/lib/systemd/scripts/nmead
	install -m644 -D nmead.conf    $pkgdir/etc/conf.d/nmead
}
