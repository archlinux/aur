pkgname=youtubemusic
_pkgname=YoutubeMusic
pkgver=1.0.11.aurpatch
pkgrel=2
pkgdesc="Youtube Music is a unofficial client to play your music."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/youtube-music"
license=('GPL')
depends=('libelectron>=2025.1' 'nss' 'gtk3' 'libxss' 'git' 'playerctl')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('ee691dce43e1d731c494c0fe23d4157d4cc0da7c5faa8c1befd3dbc733fd113b')

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
    ln -s "/opt/libelectron/electron" "$pkgdir/opt/$_pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/application-$pkgver/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
