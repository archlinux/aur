pkgname=snapchat
_pkgname=Snapchat
pkgver=1.0.5
pkgrel=1
pkgdesc="Unofficial Snapchat desktop application."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/snapchatdesktop"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('ba79416297b4c9fa115184fbb308dc21ef7e806e61760983735651b481a7b8aa')


package() {
    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname.sh
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -s "/opt/$_pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
