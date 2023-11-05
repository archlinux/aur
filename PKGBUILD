pkgname=diablo
_pkgname=Diablo
pkgver=1.0.1
pkgrel=1
pkgdesc="Diablo is an action role-playing video game developed by Blizzard North and released by Blizzard Entertainment Powered by the Devilution engine"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/7plus/application"
license=('GPL')
depends=('devilutionx-bin' 'git' 'aria2')
makedepends=('unzip')
source=("https://gitlab.com/devilutionx-bin/diablo/-/archive/1.0.0-1/diablo-$pkgver.tar.bz2")
sha256sums=('SKIP')

package() {
    cd $srcdir
    for dir in diablo-*/ ; do mv "${dir}" "$_pkgname" ;done
    cd $_pkgname
    install -dm755 "$pkgdir/usr/share/games/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cd "$srcdir/$_pkgname"
    chmod +x $pkgname
    ln -sf "/bin/devilutionx" "$srcdir/$_pkgname"
    cp -r ./ "$pkgdir/usr/share/games/$_pkgname"
    cp -r "$pkgdir/usr/share/games/$_pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/games/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
