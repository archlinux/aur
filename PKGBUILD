# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=retropong
pkgver=1.0
pkgrel=2
pkgdesc="a simple pong remake"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://sourceforge.net/projects/retropong/"
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}.tar.gz" "retropong.desktop")
depends=('sdl_mixer' 'sdl_ttf' 'bash')
md5sums=('cf5b70d1960419261530152243ee60d0'
         'e065c2ebfa1d76cddc163811d1fb8fba')

build() {
    cd $srcdir/$pkgname
    gcc -o retropong -lSDL -lSDL_mixer -lSDL_ttf retropong.c
}

package() {
    cd $srcdir/$pkgname
    install -D -m755 ./retropong $pkgdir/usr/share/retropong/retropong
    install -D -m644 ./retrofont.ttf $pkgdir/usr/share/retropong/retrofont.ttf
    install -D -m644 ./*wav $pkgdir/usr/share/retropong/
    echo -e "#"'!'"/bin/bash\ncd /usr/share/retropong/\n./retropong" >./retropong.sh
    install -D -m755 ./retropong.sh $pkgdir/usr/bin/retropong
    install -D -m644 $srcdir/retropong.desktop $pkgdir/usr/share/applications/retropong.desktop
}
