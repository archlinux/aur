pkgname=stingray
_pkgname=Stingray
pkgver=1.0.5
pkgrel=1
pkgdesc="Custom client for a private Jellyfin server."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/stingray"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git' 'playerctl')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('509ff68752561ebbfb057fe8f6dfa08d42cd54116f215c2a6e595041d98a3622')


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
    ln -s /usr/bin/libelectronmeta "$pkgdir/opt/$_pkgname/electron"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
