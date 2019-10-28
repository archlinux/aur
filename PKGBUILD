# Maintainer: Jan Claussen <jan.claussen at web dot de>
# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Jan Claussen jan.claussen at web dot de>

pkgname=plecs-blockset
_pkgname="plecs-blockset"
pkgver=v4.3.4
pkgrel=1
pkgdesc="PLECS integration into MATLAB/Simulink (license needed / 30-days free trial)"
url='http://www.plexim.com/de/products/plecs_blockset'

arch=('x86_64')
license=('custom')
provides=('plecs-blockset')
depends=('qt4' 'ncurses5-compat-libs' 'zlib')
makedepends=('coreutils')

source=("plecs-blockset.desktop" "plecs-blockset.png" "plecs-blockset.sh" "$pkgname-$pkgver-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-blockset-4-3-4_linux64.tar.gz")

md5sums=('381be723bc77af74c5aca5f070d5925c'
         '8ed62f1ce2de47c761c9244531dc154e'
         'fa37afb26f11e1dd331e886eb175a2ef'
         'f3ea20cbe94f15caa872af43b5627a23')
         
sha1sums=('ad2dcabb5ef5c51d48809df6645d4c0b74aabe6e'
          'e1d9007695acbf40ce55b47f3724c4de8b5ac270'
          'fc44048d6defd161e850bb18bdc132b3dcee6242'
          '31c618d557eab08deaf6217309106d41248f175d')

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
