# Maintainer: Evan <oicleevan@protonmail.com>
_appimage=Chatterino-x86_64.AppImage

pkgname=chatterino7
pkgver=7.3.2
pkgrel=1
pkgdesc='Second installment of the Twitch chat client series "Chatterino", release appimage'
arch=('x86_64')
url=https://chatterino.com
license=('MIT')
depends=('qt5-multimedia' 'qt5-base' 'qt5-tools' 'boost-libs' 'openssl')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
provides=('chatterino')
conflicts=('chatterino')
options=(!strip)
install=$pkgname.install
source=("https://github.com/SevenTV/chatterino7/releases/download/$pkgver/$_appimage")
md5sums=('268a6eb2fd7fef56ea06e03482e49a16')

prepare () {
    cd "$srcdir"
    chmod +x $_appimage
    ./$_appimage --appimage-extract
}

package() {
    cd "$srcdir"
    install -Dm755 $_appimage "$pkgdir/opt/$_pkgname/$_appimage"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$_appimage" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "../com.chatterino.chatterino.desktop" "$pkgdir/usr/share/applications/com.chatterino.chatterino.desktop"
    install -Dm644 "squashfs-root/chatterino.png" "$pkgdir/usr/share/pixmaps/chatterino.png"
}
