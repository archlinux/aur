# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Dominika Solarz <dominikasolarz@gmail.com>
pkgname=openlierox
pkgver=0.57_beta2
pkgrel=1
pkgdesc="An extremely addictive realtime worms shoot-em-up backed by an active gamers community"
arch=(i686 x86_64)
license=("GPL")
url="http://openlierox.sourceforge.net/"
depends=("sdl" "sdl_mixer" "sdl_image" "hawknl" "gd" "zlib" "libxml2")
makedepends=("gendesk")
source=("http://downloads.sourceforge.net/sourceforge/openlierox/OpenLieroX_${pkgver}.src.tar.bz2"
        "compilesh.patch"
	"cbytestream.patch")
md5sums=('6985e35d7d1cd7520ccba387c459f333'
         '414db95d3acac00dca935deba6cc7488'
         '485670d8cdfeef69199ed481acbbe1b3')

prepare() {
cd $srcdir/OpenLieroX
patch -p0 -i $srcdir/compilesh.patch 
patch -p0 --binary -i $srcdir/cbytestream.patch
gendesk -f -n --pkgname OpenLieroX --pkgdesc "${pkgdesc}" --exec "openlierox" --categories "Games"
}

build() {
cd $srcdir/OpenLieroX
./compile.sh
}

package() {
cd $srcdir/OpenLieroX
install -Dm755 bin/openlierox $pkgdir/usr/bin/openlierox
chmod -R 644 share/gamedir
install -dm755 $pkgdir/usr/share/OpenLieroX
cp -r share/gamedir/* $pkgdir/usr/share/OpenLieroX/
install -Dm644 OpenLieroX.desktop "$pkgdir/usr/share/applications/OpenLieroX.desktop"
install -Dm644 share/OpenLieroX.png "$pkgdir/usr/share/pixmaps/OpenLieroX.png"
}
