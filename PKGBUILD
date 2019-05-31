# Maintainer: Jan Claussen <jan.claussen at web dot de>
# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Jan Claussen jan.claussen at web dot de>

pkgname=plecs-blockset
_pkgname="plecs-blockset"
pkgver=v4.2.6
pkgrel=1
pkgdesc="PLECS integration into MATLAB/Simulink (license needed / no demo version available)"
url='http://www.plexim.com/de/products/plecs_blockset'

arch=('x86_64')
license=('custom')
provides=('plecs-blockset')
depends=('qt4' 'ncurses5-compat-libs' 'zlib')
makedepends=('coreutils')

source=("plecs-blockset.desktop" "plecs-blockset.png" "plecs-blockset.sh" "$pkgname-$pkgver-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-blockset-4-2-6_linux64.tar.gz")

sha1sums=('ad2dcabb5ef5c51d48809df6645d4c0b74aabe6e'
          'e1d9007695acbf40ce55b47f3724c4de8b5ac270'
          'fc44048d6defd161e850bb18bdc132b3dcee6242'
          '0820a419091e73bbd37e0e74517b48afc8315ad4')

package() {
    # install icon
    mkdir -p "$pkgdir/usr/share/pixmaps/"
    echo "install icon"
    install -m 644 "$srcdir/plecs-blockset.png" "$pkgdir/usr/share/pixmaps/"
   
    # make directory structure for main app
	mkdir -p "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/opt/plecs-blockset"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/licenses/plecs-blockset"

	# install desktop file
	echo "install plecs-blockset.desktop"
	install -m 664 "$srcdir/plecs-blockset.desktop" "$pkgdir/usr/share/applications/"

	echo "install start script"
	install -m 555 "$srcdir/plecs-blockset.sh" "$pkgdir/usr/bin/plecs-blockset"

	echo "install license.txt"
	install -m 664 "$srcdir/plecs/license.txt" "$pkgdir/usr/share/licenses/plecs-blockset/"
	rm "$srcdir/plecs/license.txt"

	echo "copying plecs dir"
	cp "$srcdir/plecs/." "$pkgdir/opt/plecs-blockset" -r 
}
