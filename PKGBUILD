# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: pio
pkgname=retrobreak
pkgver=2.0
pkgrel=1
pkgdesc="a simple breakout remake"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://sourceforge.net/projects/retropong/"
source=("http://downloads.sourceforge.net/project/retropong/${pkgname}.tar.gz" "${pkgname}.desktop" fix.patch)
depends=('sdl_mixer' 'sdl_ttf' 'bash')
md5sums=('af360923372fa28c99c2fade157fd841'
         '2a09f3a67150b6c7f7ee4e33cc4d04de'
         '6d4c0260fabdffce91b9dcba0bcb8749')
prepare() {
    cd $srcdir/$pkgname
    patch < ../../fix.patch
}
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
