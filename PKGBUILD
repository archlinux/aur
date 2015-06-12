# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=retrotetris
pkgver=1.0
pkgrel=2
pkgdesc="a simple tetris remake"
arch=('i686')
license=('GPL2')
url="http://sourceforge.net/projects/retropong/"
source=("http://downloads.sourceforge.net/project/retropong/${pkgname}.tar.gz" "${pkgname}.desktop")
depends=('sdl_mixer' 'sdl_ttf' 'bash')
md5sums=('1d85ef7972a731d9ccc0eee650682eb5'
         'fd30cf926d46327995848620398873fe')

build() {
    cd $srcdir/$pkgname
    gcc -o ${pkgname} -lSDL -lSDL_mixer -lSDL_ttf ${pkgname}.c
}

package() {
    cd $srcdir/$pkgname
    install -D -m755 ./${pkgname} $pkgdir/usr/share/${pkgname}/${pkgname}
    install -D -m644 ./retrofont.ttf $pkgdir/usr/share/${pkgname}/retrofont.ttf
    install -D -m644 ./*wav $pkgdir/usr/share/${pkgname}/
    echo -e "#"'!'"/bin/bash\ncd /usr/share/${pkgname}/\n./${pkgname}" >./${pkgname}.sh
    install -D -m755 ./${pkgname}.sh $pkgdir/usr/bin/${pkgname}
    install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
