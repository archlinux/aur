# Maintainer: Tosh (tosh <at> t0x0sh <dot> org)

pkgname=landeseternelles
pkgver=1.9.5
pkgrel=5
pkgdesc="Landes Eternelles is a french role playing game (mmorpg), forked from Eternal Lands."
arch=('i686' 'x86_64')
url="https://www.landes-eternelles.com"
license=(custom:'eternal_lands_license')
depends=('gtk2' 'glu' 'cal3d' 'sdl2' 'sdl2_image' 'sdl_net' 'openal' 'libvorbis' 'libxslt')

source=(
    https://landes-eternelles.com/client/1950/linux/LandesEternellesLinux.tar.gz
    landeseternelles.desktop
    landeseternelles.png
    landeseternelles
    editeurlandeseternelles
)

package() {
    mkdir -p $pkgdir/usr/{bin,share/{$pkgname,licenses/$pkgname,pixmaps,applications}}
    install -m644 $srcdir/landeseternelles.desktop $pkgdir/usr/share/applications/landeseternelles.desktop
    install -m644 $srcdir/landeseternelles.png $pkgdir/usr/share/pixmaps/landeseternelles.png
    install -m755 $srcdir/landeseternelles $pkgdir/usr/bin/landeseternelles
    install -m755 $srcdir/editeurlandeseternelles $pkgdir/usr/bin/editeurlandeseternelles

    cd "$srcdir/LandesEternelles"
    install -m755 le.$CARCH.linux.bin $pkgdir/usr/bin/le.$CARCH.linux.bin
    install -m755 mapedit.$CARCH.linux.bin $pkgdir/usr/bin/mapedit.$CARCH.linux.bin

    rm -f *.bin
    install -m644 Licence.txt $pkgdir/usr/share/licenses/$pkgname/Licence.txt
    mv -f * $pkgdir/usr/share/$pkgname/
    find $pkgdir/usr/share/$pkgname/ -type f -exec chmod 0644 {} \;
    find $pkgdir/usr/share/$pkgname/ -type d -exec chmod 0755 {} \;
}

sha256sums=('61f8a3155fc32057517e6783174ca42cf3060a38470dba7ed35a4598237d6b93'
            '1357259d4232d8533d3acdf22c63a9b650472f0ca2cf9841eb03ebd6a514e3f7'
            'f42bb2fdd8b981ca2ed5552110831e349852439b3ea0ead13f7fa328f3a30b72'
            '8c4450e426a6d290e32b30d5dfe345689ae80d871088300a5a047567d05fe4a5'
            '3166015f10f0b6592844f6935933f9684f8a055fd407eab7f9c789dac98ec998')
