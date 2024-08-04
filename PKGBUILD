pkgname=foxtelgo
_pkgname=FoxtelGo
pkgver=1.0.10
pkgrel=1
pkgdesc="Unnofficial FoxtelGo desktop application"
arch=('x86_64')
url="https://gitlab.com/linuxbombay/foxtelgo"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('f22409c8fab1172befe34c8a5cea54e34163139d8f7a2bdb1fb5618b72156e30')


package() {
    for dir in application-$pkgver; do [ -d "$dir" ] && mv "$dir" "$_pkgname"; done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
