pkgname=syncthingdesktop
_pkgname=SyncthingDesktop
pkgver=1.0.8
pkgrel=1
pkgdesc="Unnofficial Syncthing desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/syncthingdesktop"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git' 'syncthing')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/syncthingdesktop/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('7883895d9b13351e6bf9ec38fd32401a7187b6d9ae5a2ab0fd342bda0b100018')


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
    ln -sf /usr/bin/libelectronmeta "$pkgdir/opt/$_pkgname/electron"
    ln -sf "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
