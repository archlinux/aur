pkgname=gamerworld
_pkgname=GamerWorld
pkgver=1.3.2.aurpatch
pkgrel=1
pkgdesc="Play games all in one place"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/gamerworld"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('bac7f3a8d7c61ab4378195f8c84b7d20872ff1819a884aab36784fdc63be9a2a')

package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" .
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
