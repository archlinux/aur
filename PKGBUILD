# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: Boohbab

pkgname=sdlblocks
pkgver=1
pkgrel=8
pkgdesc="A Tetris remake written in C using libSDL"
arch=('i686' 'x86_64')
url="https://github.com/llopisdon/sdlblocks"
license=("GPL-2")
source=("https://github.com/llopisdon/sdlblocks/archive/master.zip" "${pkgname}.desktop")
md5sums=('53e4b5f83f9a463fdd1f88b109d298ed'
         '4178deb1bc373988c9dd305a648093c0')

if [ "$CARCH" = "i686" ]; then                                                        
    depends=('sdl_mixer' 'sdl_ttf' 'bash')
elif [ "$CARCH" = "x86_64" ]; then                                                    
    depends=('lib32-sdl_mixer' 'lib32-sdl_ttf' 'bash')
fi

build() {
cd $srcdir/$pkgname-master
make
}

package() {
cd $srcdir/$pkgname-master
mkdir -p $pkgdir/usr/bin
install -D -m644 Bitstream-Vera-Sans-Mono.ttf $pkgdir/usr/share/sdlblocks/Bitstream-Vera-Sans-Mono.ttf
install -D -m644 README.md $pkgdir/usr/share/doc/sdlblocks/README.md
install -D -m644 korobeiniki.mp3 $pkgdir/usr/share/sdlblocks/korobeiniki.mp3
install -D -m644 sdlblocks.bmp $pkgdir/usr/share/sdlblocks/sdlblocks.bmp
install -D -m644 sdlblocks.o $pkgdir/usr/share/sdlblocks/sdlblocks.o
install -D -m755 sdlblocks $pkgdir/usr/share/sdlblocks/sdlblocks
(echo "#!/bin/bash
cd /usr/share/sdlblocks
./sdlblocks") > $pkgdir/usr/bin/sdlblocks
chmod 755 $pkgdir/usr/bin/sdlblocks
install -Dm 644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
