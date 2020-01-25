# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

DLAGENTS=('http::/usr/bin/curl -A "Mozilla/4.0" -fLC - -o %o %u')
pkgname=asciisec
pkgver=0.7.2
pkgrel=4
pkgdesc="Ascii Sector: SDL roguelike with a 'Wing Commander: Privateer' theme"
arch=('i686' 'x86_64')
url="http://www.asciisector.net"
license=("custom:freeware_with_limitations")
install=asciisec.install
depends=('sdl2_mixer' 'sdl2_image')
source=("asciisec.desktop" "asciisec.png")
md5sums=('d14120b34114c0f8414e8e8fa4594d72'
         '9c994608913a1e62fb27276b0109f7bf')

[ "$CARCH" = "i686"   ] && source+=("$pkgname$pkgver-linux.tar.gz::http://www.laserbrainstudios.com/download.php?name=asciiseclinux32")
[ "$CARCH" = "x86_64" ] && source+=("$pkgname$pkgver-linux64.tar.gz::http://www.laserbrainstudios.com/download.php?name=asciiseclinux64")
[ "$CARCH" = "i686"   ] && md5sums+=('0bdd38f2b389897f40ac641a6da425e0')
[ "$CARCH" = "x86_64" ] && md5sums+=('da26c4f40bdb3738defe8aa7808b4a15')

package() {
  cd $srcdir/asciisec

  _dir=$pkgdir/usr/share/asciisec

  #mkdir -p $_dir/{data,graphics/{8x8,12x12,16x16},movies,music,quests,saves,sounds}
  mkdir -p $_dir/{data,graphics,movies,music,saves,sounds}
  chmod 775 $_dir $_dir/{saves,movies}
  chgrp games $_dir $_dir/{saves,movies}
  install -D -m 666 data/* $_dir/data
  install -D -m 644 graphics/* $_dir/graphics || true
  #install -D -m 644 graphics/8x8/* $_dir/graphics/8x8
  #install -D -m 644 graphics/12x12/* $_dir/graphics/12x12
  #install -D -m 644 graphics/16x16/* $_dir/graphics/16x16
  #install -D -m 644 quests/* $_dir/quests
  install -D -m 644 sounds/* $_dir/sounds
  install -D -m 644 {history.txt,graphics/icon.bmp,manual.pdf,readme.txt} $_dir 
  install -D -m 755 asciisec $_dir/asciisec

  install -D -m 644 ${srcdir}/asciisec.png ${pkgdir}/usr/share/pixmaps/asciisec.png
  install -D -m 644 ${srcdir}/asciisec.desktop ${pkgdir}/usr/share/applications/asciisec.desktop

  mkdir $pkgdir/usr/bin
  echo "#!/bin/sh
cd /usr/share/asciisec
./asciisec
" > $pkgdir/usr/bin/asciisec
  chmod 755 $pkgdir/usr/bin/asciisec
}
