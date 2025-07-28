pkgname=zamntc
_pkgname=ZamnTC
pkgver=h2022.hotfix1
pkgrel=2
scriptver=1.0.1
pkgdesc="Zombies Ate My Neighbors TC recreated and powered by the GZDoom (Demo)"
arch=('x86_64' 'aarch64')
license=('GPL')
url="https://gitlab.com/linuxbombay/zamn-tc"
depends=('gzdoom-bin' 'unzip' 'yad')
makedepends=('unzip')
source=("$url/zamn-tc/-/archive/$scriptver/zamntc-$scriptver.tar.bz2" "$url/archive/$pkgver/-/raw/main/zamntc-$pkgver.rar")
sha256sums=('1b665ae2df4336e3dec32e3164842b28cea351e24eb9f3396b2fd6769ca0939d'
            'af296cf8e97706d0361ef18eb6e43084e3b1004358fab8016d6097df22619f93')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm775 "$pkgdir/usr/share/games/$_pkgname"
    install -dm644 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"

    cp -rf "$srcdir/$pkgname-$scriptver/$pkgname" "$pkgdir/usr/bin"
    cp -rf "$srcdir/$pkgname-$scriptver/$pkgname.png" "$pkgdir/usr/share/pixmaps"
    cp -rf "$srcdir/$pkgname-$scriptver/$pkgname-title.png" "$pkgdir/usr/share/games/$_pkgname"
    find "$srcdir/Zombies Ate My Neighbors TC" -type f \( -iname "*.dll" -o -iname "*.exe" -o -iname "*.bat" \) -exec rm {} \;
    find "$srcdir/Zombies Ate My Neighbors TC" -type f \( -iname "*.pk3" -o -iname "*.ipk3" \) -exec cp {} "$pkgdir/usr/share/games/$_pkgname" \;
    cd "$srcdir/Zombies Ate My Neighbors TC"
    cp -r addons fm_banks soundfonts "/$pkgdir/usr/share/games/$_pkgname"
    
    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$scriptver/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}



