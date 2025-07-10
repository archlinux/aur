pkgname=syncthingdesktop
_pkgname=SyncthingDesktop
pkgver=1.0.6
pkgrel=1
pkgdesc="Unnofficial Syncthing desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/syncthingdesktop"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git' 'syncthing')
makedepends=('unzip')
source=("https://gitlab.com/linuxbombay/syncthingdesktop/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('d216a014cb52dc4e8b430c1c24a8fd568217885dac50e1fe39bc48504c0aad5a')


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
    ln -s /usr/bin/libelectronmeta "$pkgdir/opt/$_pkgname/electron"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
