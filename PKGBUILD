# Maintainer: Martin Trigaux <me@mart-e.be>
pkgname=nxt
pkgver=1.11.2
pkgrel=1
pkgdesc="The Nxt Reference Software Client for use with the Nxt Cryptocurrency."
arch=()
url="https://nxt.org"
license=('MIT/GPL')
arch=(any)
makedepends=(unzip)
depends=('jre8-openjdk')
install=$pkgname.install
source=(
	https://bitbucket.org/JeanLucPicard/nxt/downloads/nxt-client-$pkgver.zip
	nxt.service
)
sha256sums=(
	'fa5a6dbbe7265753d41e492d5db3601b2d34b1c45c7a39e7cfa45bcee1854496'
	'70717985b18b8af10b68aa6adc205912664ffccdddc52272e80bb02a19bc15fb'
)

package() {
	mkdir -p $pkgdir/opt/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp -rf $pkgname $pkgdir/opt

	echo "#!/bin/sh" > $pkgdir/usr/bin/nxt
	echo "cd /opt/nxt && bash run.sh" >> $pkgdir/usr/bin/nxt
	echo "#!/bin/sh" > $pkgdir/usr/bin/nxt-tor
	echo "cd /opt/nxt && bash run-tor.sh" >> $pkgdir/usr/bin/nxt-tor

	install -Dm644 "${srcdir}"/nxt.service "${pkgdir}"/usr/lib/systemd/system/nxt.service

	chmod 755 $pkgdir/usr/bin/nxt
	chmod 755 $pkgdir/usr/bin/nxt-tor
	mkdir nxt_db
	chmod 777 -R $pkgdir/opt/nxt
}
