# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Julian Daube <joposter at gmail dot com>

pkgname=plecs-standalone
_pkgname="plecs"
pkgver=v4.1.5
pkgrel=1
pkgdesc="A Circuit simulation tool written by plexim (license needed, only demo mode available otherwise)"
url='http://www.plexim.com/de/products/plecs_standalone'

arch=('x86_64')
license=('custom')
provides=('plecs-standalone')
depends=('qt4' 'ncurses5-compat-libs' 'zlib')
makedepends=('coreutils')

source=("plecs.desktop" "plecs.png" "plecs.sh" "$pkgname-$pkgver-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-standalone-4-1-5_linux64.tar.gz")

md5sums=('0fc656b8eb78a265ae2d85e6a1c4d0f2'
         '8ed62f1ce2de47c761c9244531dc154e'
         '675ece23be004504ae71890909f8819c'
         'a4663fff210227cc12e2a9676e89e45f')
sha1sums=('e38b63e0737cedd00675d52bcb639f47607938d8'
          'e1d9007695acbf40ce55b47f3724c4de8b5ac270'
          '4150e3dcc41210b7a28b7042972f76e7f6f3ac71'
          'd0e6cb72a9c07d37e8132e29a34344d731cd7f29')

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
	rm "$srcdir/plecs/PLECS"
	cp "$srcdir/plecs/." "$pkgdir/opt/plecs" -r 
}
