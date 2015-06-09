# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=holotz-castle
pkgver=1.3.14
pkgrel=3
pkgdesc="A platform game with high doses of mystery"
url="http://www.mainreactor.net"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sdl_mixer' 'sdl_ttf' 'sdl_image')
source=(http://www.mainreactor.net/holotzcastle/download/holotz-castle-$pkgver-src.tar.gz
	    holotz-castle-archpatch-1.diff holotz-castle-gcc44.patch)
md5sums=('d304b73cc01576325abc31a29a949f11'
         '297c293f80f22e6a4d9bf5e8f1c1685e'
         '5db8efdbb380c93af02ccd17f1105a17')

build() {
    cd $srcdir/holotz-castle-$pkgver-src
    patch -p1 <../holotz-castle-gcc44.patch
    patch -p1 <../holotz-castle-archpatch-1.diff
    sed -i 's/-lSDL_image/-lm -lz -lSDL_image/' src/Makefile
    make HC_BASE=/usr/share/holotz-castle/ HC_BIN_DIR=/usr/bin/
    make HC_BASE=/usr/share/holotz-castle/ HC_BIN_DIR=/usr/bin/ DESTDIR=$pkgdir install
}
