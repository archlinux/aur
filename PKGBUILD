pkgname=youtube
_pkgname=Youtube
pkgver=1.1.7
pkgrel=1
pkgdesc="Unnofficial Youtube desktop application"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/youtube-desktop"
license=('GPL')
depends=('libelectron-electron-meta' 'libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git')
makedepends=('unzip')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('04e4f0990a14fe8676221a7c1c239085ba1d32056290fc9b82654055a5b2d6f2')

package() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/bin"

    cd "$srcdir/application-$pkgver"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/application-$pkgver"  
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/youtubeapp.svg" "$pkgdir/usr/share/pixmaps"  

    # Link to binary
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
