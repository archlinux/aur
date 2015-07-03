# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>
# Contributer: Austin <doorknob60 at gmail dot com>
pkgname=turtle_arena-bin
_gamever=0.6.1-0
pkgver=0.6.1
pkgrel=3
pkgdesc="Free and open source cross-platform third-person action game using a modified version of the ioquake3 engine."
url="http://ztm.x10hosting.com/ta/index.htm"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('sdl' 'xdg-utils' 'libtheora' 'libvorbis')
provides=('turtlearena' 'turtlearena-server')
source=("turtle_arena.png" "turtle_arena.desktop" "turtle_arena-server.sh" "turtle_arena.sh" "http://turtlearena.googlecode.com/files/turtlearena-$_gamever.zip")
md5sums=('4c1a6aa909a97416b74e46dec7f5a55e'
         '6c72d6ef50651bba651035e763d74caf'
         '4144e04874db29f8b7fc0f3b2d796d29'
         '93fc0812f750061014519a752b6f1ec6'
         'b169e54f729c837c11840148fb281b49')

         
build() {
	rm -R $srcdir/turtlearena-$_gamever/settings	
	if [ $arch == "$CARCH" ]; then
		rm -R $srcdir/turtlearena-$_gamever/*.{dll,exe,i386}
		mv $srcdir/turtlearena-$_gamever/turtlearena.$CARCH $srcdir/turtlearena-$_gamever/turtle_arena
		mv $srcdir/turtlearena-$_gamever/turtlearena-server.$CARCH $srcdir/turtlearena-$_gamever/turtle_arena-server
	else
		rm -R $srcdir/turtlearena-$_gamever/*.{dll,exe,$CARCH}
		mv $srcdir/turtlearena-$_gamever/turtlearena.i386 $srcdir/turtlearena-$_gamever/turtlearena
		mv $srcdir/turtlearena-$_gamever/turtlearena-server.i386 $srcdir/turtlearena-$_gamever/turtlearena-server
	fi
}


package() {
  install -d -m755 $pkgdir/usr
  install -d -m755 $pkgdir/usr/share/
  install -d -m755 $pkgdir/usr/bin
  install -m755 $srcdir/turtle_arena.sh $pkgdir/usr/bin/turtle_arena.sh
  install -m755 $srcdir/turtle_arena-server.sh $pkgdir/usr/bin/turtle_arena-server.sh
  chmod -x turtle_arena.sh
  chmod -x turtle_arena-server.sh
  install -d -m755 $pkgdir/usr/share/turtle_arena
  cp -R $srcdir/turtlearena-$_gamever/* $pkgdir/usr/share/turtle_arena
  chmod 755 -R $pkgdir/usr/share/turtle_arena
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps
  install -m755 turtle_arena.desktop $pkgdir/usr/share/applications
  install -m755 turtle_arena.png $pkgdir/usr/share/pixmaps/turtle_arena.png
  }

 
