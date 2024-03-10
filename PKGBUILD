pkgname=syncthingdesktop
_pkgname=SyncthingDesktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Unnofficial Syncthing desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/twitterdesktop/application"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git' 'syncthing')
makedepends=('unzip')
source=("https://gitlab.com/syncthingdesktop/application/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('SKIP')


package() {
    cd "$srcdir/application-$pkgver-$pkgrel"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver-$pkgrel"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver-$pkgrel/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
