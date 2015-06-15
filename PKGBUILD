#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Shockrates <antisocrates@gmail.com>

pkgname=gridwars
pkgver=9.3.2006
pkgrel=8
pkgdesc="Grid Wars 2: A clone of Geometry Wars"
arch=('i686' 'x86_64')
url="http://gridwars.marune.de/"
license=('GPL')
[ "$CARCH" = "i686" ] && depends=('libgl' 'libstdc++5' 'alsa-oss')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libgl' 'lib32-libstdc++5' 'lib32-libxxf86vm' 'lib32-alsa-oss')
source=('http://gridwars.marune.de/bin/gridwars_lin.zip'
        'gridwars.desktop')
sha512sums=('7aac0bbc3b584ccaac5c0ac05e1be14f1b2bada776506ffadc5c45107a13eb4e0b16e7f375d1caa865c6aaa277c2a7a37d8061fed32628d9a0da2f45129ab8dd'
            'b085da3b75fefb1d25c3204d5b3b20d5dc6a2b23dbf7e29f9585853df2d31d4dc41a644b94bd9711b43096f12bd776dd51075742a0dcb1c3027e6753bfd35d67')
build() {
	cd $srcdir

}

package() {

#Creating Directories

	install -m755 -d $pkgdir/usr/{bin,share/{applications,pixmaps,games/gridwars/{gfx/{High,Med,Low,solid},music,sounds}}}

#Installing

	install -D -m644 $srcdir/bass.dll $pkgdir/usr/share/games/gridwars/
	install -D -m664 $srcdir/Config.txt $pkgdir/usr/share/games/gridwars/Config.txt
	install -D -m755 $srcdir/gridwars $pkgdir/usr/share/games/gridwars/
	install -D -m644 $srcdir/gfx/glow.bmp $pkgdir/usr/share/games/gridwars/gfx/
	for i in High Low Med solid ; do
		install -D -m644 $srcdir/gfx/$i/* $pkgdir/usr/share/games/gridwars/gfx/$i
	done
	install -D -m644 $srcdir/music/* $pkgdir/usr/share/games/gridwars/music/
	install -D -m644 $srcdir/sounds/* $pkgdir/usr/share/games/gridwars/sounds/
	install -D -m644 $srcdir/gridwars.desktop $pkgdir/usr/share/applications/gridwars.desktop
	install -D -m644 $srcdir/gfx/High/whiteplayer.png $pkgdir/usr/share/pixmaps/gridwars.png

#Linking binary and stuff

	ln -sf /usr/share/games/gridwars/gridwars $pkgdir/usr/bin/gridwars
        chgrp games $pkgdir/usr/share/games/gridwars/Config.txt        
}