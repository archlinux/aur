pkgname=phoenixbrowser
_pkgname=PhoenixBrowser
pkgver=0.71
pkgrel=1
pkgdesc="A light and snappy web browser"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/phoenix/phoenix"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git' 'bitwarden-cli')
makedepends=('unzip')
source=("$url/-/archive/$pkgver/phoenix-$pkgver.tar.bz2")
sha256sums=('ede1cb52e3e235c4d03f523b1e46cb889de441d312e1d434e1371bf7a75f913a')

package() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps" 
    
    cd "$srcdir/phoenix-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/phoenix-$pkgver"

    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/sysicons/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"

    # Link to binary
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/phoenix-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
