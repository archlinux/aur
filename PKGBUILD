# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=kulic
pkgver=1.1
pkgrel=2
pkgdesc="2d shooting game"
url=('http://hippo.nipax.cz/download.cz.php?id=59')
arch=('i686')
license=('GPL-2')
depends=('allegro' 'libjpeg')
source=("http://hippo.nipax.cz/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('16aff4bded3ae1c6712ca71d4d429730')

build() {
cd $srcdir/${pkgname}-${pkgver}
# some patching needed here
#sed -i 's/iostream.h/iostream/' src/*.c*
./configure --prefix=/usr
make
}

package() {
cd $srcdir/${pkgname}-${pkgver}
make DESTDIR="$pkgdir/" install
mv $pkgdir/usr/bin/kulic $pkgdir/usr/share/kulic
( echo "#!/bin/bash
cd /usr/share/kulic
./kulic" ) > $pkgdir/usr/bin/kulic
chmod 755 $pkgdir/usr/bin/kulic
cd misc
install -D -m644 kulic.6 $pkgdir/usr/share/man/man6/kulic.6
install -D -m644 kulic.xpm $pkgdir/usr/share/pixmaps/kulic.xpm
install -D -m644 kulic.desktop $pkgdir/usr/share/applications/kulic.desktop
}
