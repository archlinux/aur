pkgname=wolfboa
_pkgname=Wolfboa
pkgver=c31.1.1
pkgrel=2
scriptver=1.0.1.2
pkgdesc="Wolfenstein: Blade of Agony game powered by the GZDoom."
arch=('x86_64' 'aarch64')
license=('GPL')
url="https://gitlab.com/linuxbombay/wolfboa"
depends=('gzdoom-bin' 'aria2' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/wolfboa/-/archive/$scriptver/wolfboa-$scriptver.tar.bz2" "$url/game-files/$pkgver/-/raw/main/boa_$pkgver.zip")
sha256sums=('7ee42be55d2359125d62bf2c910745b333e0ffdbb740bd182fdad8ce4692fdf0'
            '32e3b9aeaa9d970fed253ec5a830db9ee5cfe51612ffa1831b7e804427dcc68e')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"

    cp -rf "$srcdir/$pkgname-$scriptver/$pkgname" "$pkgdir/usr/bin"
    cp -rf "$srcdir/$pkgname-$scriptver/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    cp -rf "$srcdir/$pkgname-$scriptver/$pkgname-title.png" "$pkgdir/usr/share/games/$_pkgname"
    find $srcdir -type f \( -iname "*.dll" -o -iname "*.exe" \) -exec rm {} \;
    find $srcdir -type f \( -iname "*.boa" -o -iname "*.pk3" -o -iname "*.ipk3" \) -exec cp {} "$pkgdir/usr/share/games/$_pkgname" \;
    cd $srcdir
    cp -r addons fm_banks language launcher-resource soundfonts "/$pkgdir/usr/share/games/$_pkgname"
    
    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$scriptver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}



