# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=enemylines7
pkgver=0.8
pkgrel=3
pkgdesc="Enemy lines - computer game series"
arch=('i686')
url="http://proj.phk.at/el/7/"
license=('GPL-3')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'mesa')
source=("http://proj.phk.at/el/7/enelin7-${pkgver}.zip" "enelin7.desktop")
md5sums=('ec94352523c9679d6b0cc3678a510283' '3ddc3e95f3c475719380fe14147b44ef')

build() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/enelin7-$pkgver/src
  make
}

package() {
  cd $srcdir/enelin7-$pkgver/src
  install -D -m755 ./enelin7 $pkgdir/usr/share/enelin7/enelin7
  cp -R ../data $pkgdir/usr/share/enelin7/data 
  find $pkgdir/usr/share/enelin7/data -type f -print0 | xargs -0 chmod 644
  echo "#!/bin/sh
cd /usr/share/enelin7
./enelin7" > $pkgdir/usr/bin/enelin7
  chmod 755 $pkgdir/usr/bin/enelin7
  install -D -m644 $srcdir/enelin7.desktop $pkgdir/usr/share/applications/enelin7.desktop
}
