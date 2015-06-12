# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=fotbal
pkgver=1
pkgrel=4
pkgdesc="a simple 2d soccer game"
url=('http://hippo.nipax.cz/download.cz.php?id=41')
arch=('i686' 'x86_64')
license=("GPL-2")
depends=('allegro')
source=("http://hippo.nipax.cz/src/${pkgname}-src.tar.gz" "fotbal.desktop")
md5sums=('ed4146b05c3a074cd63c483bb685b1ed'
         '3a8909900f3778dbed46a5008dd9eda9')

build() {
cd $srcdir/${pkgname}-src
# some patching needed here
sed -i -e 's/<fstream.h>/<fstream>/' -e 's/ifstream/std::ifstream/' football.cxx
make
}

package() {
cd $srcdir/${pkgname}-src
mkdir -p $pkgdir/usr/{share/fotbal,bin}
install -D -m755 football $pkgdir/usr/share/fotbal/football
install -D -m644 *.pcx *.txt fotbal.dat $pkgdir/usr/share/fotbal
( echo "#!/bin/bash
cd /usr/share/fotbal
./football" ) > $pkgdir/usr/bin/fotbal
chmod 755 $pkgdir/usr/bin/fotbal
install -D -m644 $srcdir/fotbal.desktop $pkgdir/usr/share/applications/fotbal.desktop
}
