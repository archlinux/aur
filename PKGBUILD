# Maintainer: Ckat <ckat@teknik.io>
_pkgname=chatterino
_appimage=Chatterino-x86_64.AppImage

pkgname=chatterino2-appimage
pkgver=2.4.4
pkgrel=1
pkgdesc='Second installment of the Twitch chat client series "Chatterino", release appimage'
arch=('x86_64')
url=https://chatterino.com
license=('MIT')
depends=('fuse2')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=('chatterino')
conflicts=('chatterino')
options=(!strip)
install=$pkgname.install
source=("https://github.com/Chatterino/chatterino2/releases/download/v$pkgver/$_appimage")
sha256sums=('947351c6baf95e18d70565da909f92147cd040ef27f6ed0c39a00d9394cda5f7')

prepare () {
    cd "$srcdir"
    chmod +x $_appimage
    ./$_appimage --appimage-extract
}

package() {
    cd "$srcdir"
    install -Dm755 $_appimage "$pkgdir/opt/$_pkgname/$_appimage"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_appimage" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "squashfs-root/com.chatterino.chatterino.desktop" "$pkgdir/usr/share/applications/com.chatterino.chatterino.desktop"
    install -Dm644 "squashfs-root/chatterino.png" "$pkgdir/usr/share/pixmaps/chatterino.png"
}
