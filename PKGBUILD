# Maintainer: Jan Claussen <jan.claussen10 at web dot de>
# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Julian Daube <joposter at gmail dot com>

pkgname=plecs-standalone
_pkgname="plecs"
pkgver=v4.3.4
pkgrel=1
pkgdesc="A circuit simulation tool written by Plexim (license needed / 30-days free trial)"
url='http://www.plexim.com/de/products/plecs_standalone'

arch=('x86_64')
license=('custom')
provides=('plecs-standalone')
depends=('qt4' 'ncurses5-compat-libs' 'zlib')
makedepends=('coreutils')

source=("plecs.desktop" "plecs.png" "plecs.sh" "$pkgname-$pkgver-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-standalone-4-3-4_linux64.tar.gz")

md5sums=('7e0990a952785f929402da88efbd6cde'
         '8ed62f1ce2de47c761c9244531dc154e'
         '675ece23be004504ae71890909f8819c'
         '0eb191ecd58b39d5d171fae6e8ecd281')
sha1sums=('6dbc37f69996baf211e0c387cc5ee6bb4c456619'
          'e1d9007695acbf40ce55b47f3724c4de8b5ac270'
          '4150e3dcc41210b7a28b7042972f76e7f6f3ac71'
          'f092fab5bcd7e4abbfb958e1b07c32c187e40c6f')
package() {
    # install icon
    mkdir -p "$pkgdir/usr/share/pixmaps/"
    echo "install icon"
    install -m 644 "$srcdir/plecs.png" "$pkgdir/usr/share/pixmaps/"
   
    # make directory structure for main app
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/opt/plecs"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/licenses/plecs"

	# install desktop file
	echo "install plecs.desktop"
	install -m 664 "$srcdir/plecs.desktop" "$pkgdir/usr/share/applications/"

	echo "install start script"
	install -m 555 "$srcdir/plecs.sh" "$pkgdir/usr/bin/plecs"

	echo "install license.txt"
	install -m 664 "$srcdir/plecs/license.txt" "$pkgdir/usr/share/licenses/plecs/"
	rm "$srcdir/plecs/license.txt"

	echo "copying plecs dir"
	cp "$srcdir/plecs/." "$pkgdir/opt/plecs" -r 
}
