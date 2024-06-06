pkgname=stingray
_pkgname=Stingray
pkgver=1.0.1
pkgrel=1
pkgdesc="Custom client for a private Jellyfin server."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/stingray"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git' 'playerctl')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('de93b3d47e3f830cdc56ca6ec97d363722d46c3179453be5105fae81704ee679')


package() {
    cd "$srcdir/$pkgname-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$pkgname-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
