# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
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
sha256sums=('51b5070f48f573bd5c33290740bdcc313f71aa97f78b637152ff827d85ff5109'
            '2ad4d272c2d4696b27eb3f8c5bff3b9d0c540703680124796c147cbf11eabb8e')

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
