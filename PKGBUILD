# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=sem
pkgver=0.4
pkgrel=2
pkgdesc="an unfinished 3d worms/scorched 3d clone"
url=('http://hippo.nipax.cz/download.cz.php?id=69')
arch=('i686')
license="GPL-2"
depends=('sdl' 'sdl_ttf' 'sdl_image')
source="http://hippo.nipax.cz/src/${pkgname}-${pkgver}-src.tar.gz"
md5sums=('4f69ac684cf3f9a2d3bd70ec7a05ec51')

build() {
mkdir -p $pkgdir/usr/{share/sem/{data/{bullets,players,terrains},cfg/terrains},bin}
cd $srcdir/${pkgname}-${pkgver}-src
# some patching needed here
sed -i 's/^#include "cparticleengine.h"/#include <algorithm>\n&/' cparticleengine.cpp
make depend
make
}

package() {
cd $srcdir/${pkgname}-${pkgver}-src
install -D -m755 sem $pkgdir/usr/share/sem/sem
install -D -m644 cfg/terrains/* $pkgdir/usr/share/sem/cfg/terrains
install -D -m644 cfg/basecode.ini $pkgdir/usr/share/sem/cfg/basecode.ini
install -D -m644 data/bullets/* $pkgdir/usr/share/sem/data/bullets
install -D -m644 data/players/* $pkgdir/usr/share/sem/data/players
install -D -m644 data/terrains/* $pkgdir/usr/share/sem/data/terrains
install -D -m644 data/* $pkgdir/usr/share/sem/data || true
( echo "#!/bin/bash
cd /usr/share/sem
./sem" ) > $pkgdir/usr/bin/sem
chmod 755 $pkgdir/usr/bin/sem
}
