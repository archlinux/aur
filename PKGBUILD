# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Julian Daube <joposter at gmail dot com>

pkgname=plecs-standalone
_pkgname="plecs"
pkgver=v3.7.3
pkgrel=1
pkgdesc="A Circuit simulation tool written by plexim (license needed, only demo mode available otherwise)"
url='http://www.plexim.com/de/products/plecs_standalone'

arch=('x86_64')
license=('custom')
provides=('plecs-standalone')
depends=('octave' 'qt4')
makedepends=("findutils")

source=("$pkgname-$pkgver.tar.gz::http://www.plexim.com/sites/default/files/packages/plecs-standalone-3-7-3_linux64.tar.gz")
md5sums=('d69a0f2ee9eabb31cad8a554a4cb0a29')
sha1sums=('000148d3fe1438abb1bffc44df42bfe9ef30b30c')

package() {
	cd "$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/plecs"
	mkdir -p "$pkgdir/usr/share/licenses/plecs"
	mkdir -p "$pkgdir/usr/share/plecs/octave/bin"

	install -m 664 license.txt "$pkgdir/usr/share/licenses/plecs/LICENSE"
	install -m 664 Components.plecs "$pkgdir/usr/share/plecs/"
	install -m 775 PLECS.bin "$pkgdir/usr/share/plecs/plecs"

	cp plugins "$pkgdir/usr/share/plecs/" -r
	find "$pkgdir/usr/share/plecs/plugins" -type f -exec chmod 775 {} +

	cp onlinehelp "$pkgdir/usr/share/plecs/" -r
	find "$pkgdir/usr/share/plecs/onlinehelp" -type f -exec chmod 664 {} +

	cp pilframeworks "$pkgdir/usr/share/plecs/" -r 
	find "$pkgdir/usr/share/plecs/pilframeworks" -type f -exec chmod 775 {} +

	
	ln -s /usr/bin/octave-cli "$pkgdir/usr/share/plecs/octave/bin/octave"

	echo '#!/bin/sh' > plecs
	echo 'cd /usr/share/plecs/' >> plecs
	echo 'exec ./plecs' >> plecs
	
	install -m 775 -t "$pkgdir/usr/bin/" plecs 
}
