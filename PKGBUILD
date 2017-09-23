# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=railroadrampage
pkgver=1.2
pkgrel=5
pkgdesc="an action tower defence-type game"
arch=('any')
url="http://neotron-games.blogspot.com/2009/10/railroad-rampage.html"
license=("GPL-3")
install="railroadrampage.install"
source=("https://mirror.amdmi3.ru/distfiles/RailroadRampage_${pkgver}_Linux.zip" "railroadrampage.desktop")
md5sums=('7c9190ff07e2e3ce761e289ae422a803'
         '0530f9cd35ea83ae9ab627283b6b4c0c')
depends_i686=('libsdl_mixer')
depends_x86_64=('lib32-sdl_mixer')

package() {
  mkdir -p $pkgdir/usr/{share/railroadrampage,bin}
  cd $srcdir/RailroadRampage_Linux
  # /bin/tar cf - --exclude=bgdruntime --exclude=RailroadRampage.sh --exclude=RailroadRampage.dcb * | ( cd $pkgdir/usr/share/railroadrampage/; tar xfp - )
  /bin/tar cf - * | ( cd $pkgdir/usr/share/railroadrampage/; tar xfp - )
  # fix file permissions (zip does not preserve those)
  find $pkgdir/usr/share/railroadrampage -type f -print0 | xargs -0 chmod 644
  chmod 755 $pkgdir/usr/share/railroadrampage/RailroadRampage.sh \
	    $pkgdir/usr/share/railroadrampage/bgdruntime/bgdc \
	    $pkgdir/usr/share/railroadrampage/bgdruntime/bgdi

  echo "#!/bin/sh
cd /usr/share/railroadrampage
./RailroadRampage.sh" > $pkgdir/usr/bin/railroadrampage
  chmod 755 $pkgdir/usr/bin/railroadrampage
  install -Dm644 $srcdir/RailroadRampage_Linux/RailroadRampage.png $pkgdir/usr/share/pixmaps/railroadrampage.png
  install -Dm644 $srcdir/railroadrampage.desktop $pkgdir/usr/share/applications/railroadrampage.desktop
}
