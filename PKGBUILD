pkgname=syncthingdesktop
_pkgname=SyncthingDesktop
pkgver=1.0.3
pkgrel=1
pkgdesc="Unnofficial Syncthing desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/syncthingdesktop"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git' 'syncthing')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/syncthingdesktop/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('bbdb71d81fc878957ce2ce63432bb6f8d03efdcfdb5e864ea63467406956b097')


package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
