# Maintainer: Tosh (tosh <at> t0x0sh <dot> org)

pkgname=landeseternelles
pkgver=1.9.4
pkgrel=1
pkgdesc="Landes Eternelles is a french role playing game (mmorpg), forked from Eternal Lands."
arch=('i686' 'x86_64')
url="https://www.landes-eternelles.com"
license=(custom:'eternal_lands_license')
depends=(sh libglvnd gtk2)

source=(
    https://landes-eternelles.com/client/1940/linux/LandesEternellesLinux.tar.gz
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
    install -m755 le.$CARCH.static.bin $pkgdir/usr/bin/le.$CARCH.static.bin
    install -m755 mapedit.$CARCH.static.bin $pkgdir/usr/bin/mapedit.$CARCH.static.bin
    
    rm -f *.bin icon.bmp
    install -m644 Licence.txt $pkgdir/usr/share/licenses/$pkgname/Licence.txt
    mv -f * $pkgdir/usr/share/$pkgname/
    find $pkgdir/usr/share/$pkgname/ -type f -exec chmod 0644 {} \;
    find $pkgdir/usr/share/$pkgname/ -type d -exec chmod 0755 {} \;
}

sha256sums=('f5e249cf518914978e1e97aa49ca1f58d236c6984acb6771e248f2d482db3f2b'
            '1357259d4232d8533d3acdf22c63a9b650472f0ca2cf9841eb03ebd6a514e3f7'
            'f42bb2fdd8b981ca2ed5552110831e349852439b3ea0ead13f7fa328f3a30b72'
            '066457e0c01436667bf85d3d34919fba87a6cf1b2953e6960c6353826a862dd4'
            '5da82012b1c9aa39d7b151b97b7749b7d5145691d4f6aedeca3cfa45689b2704')
