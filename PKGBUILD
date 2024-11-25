pkgname=youtubemusic
_pkgname=YoutubeMusic
pkgver=1.0.10
pkgrel=1
pkgdesc="Youtube Music is a unofficial client to play your music."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/youtube-music"
license=('GPL')
depends=('libelectron' 'nss' 'gtk3' 'libxss' 'git' 'playerctl')
source=("$url/application/-/archive/$pkgver/application-$pkgver.tar.bz2")
sha256sums=('a84093766aa7e713a0715e9013c2e2c85735d7cb625276201efdccc470d34410')

package() {
        for dir in application-$pkgver ; do mv "${dir}" "$_pkgname" ;done
    cd "$srcdir/$_pkgname"
    chmod +x $pkgname
    ln -sf "/opt/libelectron/node_modules" "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname"
    install -dm755 "$pkgdir/usr/share/pixmaps"    
    cp -r ./ "$pkgdir/opt/$_pkgname"
    cp -r "$pkgdir/opt/$_pkgname/$pkgname.svg" "$pkgdir/usr/share/pixmaps"  


    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Desktop Entry
    install -Dm644 "$srcdir/$_pkgname/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
