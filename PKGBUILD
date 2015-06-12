# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=asciisec
pkgver=0.7.1.4
pkgrel=1
pkgdesc="SDL roguelike with a 'Wing Commander: Privateer' theme"
arch=('i686' 'x86_64')
url="http://www.asciisector.net"
license=("custom:freeware_with_limitations")
install="asciisec.install"
depends=('sdl_mixer')
source=("music.zip::$url/cgi-bin/download.cgi?music" "asciisec.desktop" "asciisec.png")
md5sums=('f061f51a41d98561447b750de8a45400'
         'd14120b34114c0f8414e8e8fa4594d72'
         '9c994608913a1e62fb27276b0109f7bf')

[ "$CARCH" = "i686"   ] && source+=("$pkgname$pkgver-linux.tar.gz::$url/cgi-bin/download.cgi?linux")
[ "$CARCH" = "x86_64" ] && source+=("$pkgname$pkgver-linux64.tar.gz::$url/cgi-bin/download.cgi?linux64")
[ "$CARCH" = "i686"   ] && md5sums+=('e1b659556662503f71ff3611004265a8')
[ "$CARCH" = "x86_64" ] && md5sums+=('6d7049fc1dfb392a7ebd6cd27f7539d2')

build() {
true
}

package() {
  cd $srcdir/asciisec

  _dir=$pkgdir/usr/share/asciisec

  mkdir -p $_dir/{data,graphics/{8x8,12x12,16x16},movies,music,quests,saves,sounds}
  chmod 775 $_dir $_dir/{quests,saves,movies}
  chgrp games $_dir $_dir/{quests,saves,movies}
  install -D -m 644 data/* $_dir/data
  install -D -m 644 graphics/* $_dir/graphics || true
  install -D -m 644 graphics/8x8/* $_dir/graphics/8x8
  install -D -m 644 graphics/12x12/* $_dir/graphics/12x12
  install -D -m 644 graphics/16x16/* $_dir/graphics/16x16
  install -D -m 644 quests/* $_dir/quests
  install -D -m 644 sounds/* $_dir/sounds
  install -D -m 644 {history.txt,icon.bmp,manual.pdf,readme.txt} $_dir 
  install -D -m 755 asciisec $_dir/asciisec
  install -D -m 644 $srcdir/*.ogg $_dir/music

  install -D -m 644 ${srcdir}/asciisec.png ${pkgdir}/usr/share/pixmaps/asciisec.png
  install -D -m 644 ${srcdir}/asciisec.desktop ${pkgdir}/usr/share/applications/asciisec.desktop

  mkdir $pkgdir/usr/bin
  echo "#!/bin/sh
cd /usr/share/asciisec
./asciisec
" > $pkgdir/usr/bin/asciisec
  chmod 755 $pkgdir/usr/bin/asciisec
}
