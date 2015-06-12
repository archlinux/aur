# Maintainer: jose1711 <jose1711 at gmail dot com>

pkgname=gish-demo
pkgver=1
pkgrel=4
pkgdesc="side scrolling tar ball fun game (demo)"
arch=('i686' 'x86_64')
url="http://www.chroniclogic.com/"
license=('other')
source=("http://s159260531.onlinehome.us/demos/gishdemo.tar.gz" "gish-demo.desktop")
depends=('openal')
makedepends=('imagemagick')
md5sums=('144b79a7200355b5c274bd395e016c1e'
         'cd35c84b59a2a0628c068e4d1ebc9b12')

build() {
true
}

package() {
	mkdir -p ${pkgdir}/usr/{share/gish-demo/{animation,leveldemo,lib,music,replay,sound,texture},bin}
	cd ${srcdir}/gishdemo
	# this is going to be dirty..
	mkdir lib; cd lib
	ln -s /usr/lib/libopenal.so ./libopenal.so.0
	ln -s /usr/lib/libopenal.so ./libopenal.so.0.0.7
	cd ..

	install -D -m 644 animation/* ${pkgdir}/usr/share/gish-demo/animation
	install -D -m 644 leveldemo/* ${pkgdir}/usr/share/gish-demo/leveldemo
	cp -d lib/libopenal* ${pkgdir}/usr/share/gish-demo/lib
	install -D -m 644 music/* ${pkgdir}/usr/share/gish-demo/music
	install -D -m 644 replay/* ${pkgdir}/usr/share/gish-demo/replay
	install -D -m 644 sound/* ${pkgdir}/usr/share/gish-demo/sound
	install -D -m 644 texture/* ${pkgdir}/usr/share/gish-demo/texture
	install -D -m 644 texture/* ${pkgdir}/usr/share/gish-demo/texture
	install -D -m 644 *.{txt,html,swf,bmp} ${pkgdir}/usr/share/gish-demo/
	install -D -m 755 gishdemo ${pkgdir}/usr/share/gish-demo/gishdemo
	install -D -m 755 gishdemo_64 ${pkgdir}/usr/share/gish-demo/gishdemo_64

	echo "#!/bin/sh
cd /usr/share/gish-demo
LD_LIBRARY_PATH=lib ./gishdemo -sound \"\$@\"" > $pkgdir/usr/bin/gish-demo
	if [ "${arch}" = "x86_64" ]; then
	echo "#!/bin/sh
cd /usr/share/gish-demo
LD_LIBRARY_PATH=lib ./gishdemo_64 -sound \"\$@\"" > $pkgdir/usr/bin/gish-demo
	fi
	chmod 755 $pkgdir/usr/bin/gish-demo
	convert gish.bmp gish.png
	install -D -m644 $srcdir/gishdemo/gish.png $pkgdir/usr/share/pixmaps/gish.png
	install -D -m644 $srcdir/gish-demo.desktop $pkgdir/usr/share/applications/gish-demo.desktop
	}
