# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Julian Daube <joposter at gmail dot com>

pkgname=plecs-standalone
_pkgname="plecs"
pkgver=v4.0.6
pkgrel=1
pkgdesc="A Circuit simulation tool written by plexim (license needed, only demo mode available otherwise)"
url='http://www.plexim.com/de/products/plecs_standalone'

arch=('x86_64')
license=('custom')
provides=('plecs-standalone')
depends=('qt4' 'ncurses5-compat-libs')
makedepends=('coreutils')

source=("plecs.desktop" "plecs.sh" "$pkgname-$pkgver-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-standalone-4-0-6_linux64.tar.gz")
md5sums=('1304e0fb305fbaa4f7725dde65b646f8' '9d22a86f620506b3e5768d54e338af5d' '26b6e7679c7253721b32101a3050cb0d')
sha1sums=('21635d737fcb2ec287eb195e2f75b2f895fd032f' '5e708849ba6a5fbb55bcbf97debfca3168230c63' '2a99411ec2329483487362918f29b9a1d8682842')

package() {
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/opt/plecs"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/licenses/plecs"

	# desktop file
	echo "install plecs.desktop"
	install -m 664 "$srcdir/plecs.desktop" "$pkgdir/usr/share/applications/"

	echo "install start script"
	install -m 555 "$srcdir/plecs.sh" "$pkgdir/usr/bin/plecs"

	echo "install license.txt"
	install -m 664 "$srcdir/plecs/license.txt" "$pkgdir/usr/share/licenses/plecs/"
	
	echo "copying plecs dir"
	rm "$srcdir/plecs/PLECS"
	cp "$srcdir/plecs/." "$pkgdir/opt/plecs" -r 
}
