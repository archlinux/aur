# Maintainer: Martin Trigaux <me@mart-e.be>
pkgname=nxt
pkgver=1.11.7
pkgrel=2
pkgdesc="The Nxt Reference Software Client for use with the Nxt Cryptocurrency."
arch=()
url="https://nxt.org"
license=('MIT/GPL')
arch=(any)
makedepends=(unzip)
depends=('jre8-openjdk')
install=$pkgname.install
source=(
	https://bitbucket.org/Jelurida/nxt/downloads/nxt-client-$pkgver.zip
	nxt.service
)
sha256sums=(
	'bfed4c5c2df82e876f88885c1d0501810edf49fc4998d694e74852d6ab176d57'
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
