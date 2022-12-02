# Maintainer: Ckat <ckat@teknik.io>
_pkgname=chatterino
_appimage=Chatterino-x86_64.AppImage

pkgname=chatterino2-appimage
pkgver=2.4.0
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
source=("https://github.com/Chatterino/chatterino2/releases/download/v$pkgver/$_appimage")
sha256sums=('67b8b090ac00b90a9391b2264fd45d103ed6e87b252de11dc58ffc9eb2ec1519')

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
