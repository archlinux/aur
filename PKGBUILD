pkgname=googlekeep
_pkgname=GoogleKeep
pkgver=1.0.8
pkgrel=1
pkgdesc="Unnofficial Google Keep desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/googlekeep-desktop"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'gtk4' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('14037bae4fe66dd178ba09c00be7e1c9f8ce8603c4d53e3be8cf81d601bd3ae2')

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
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
