# Maintainer: dtomvan <18gatenmaker6 at gmail dot com>

_appimage="Chatterino-x86_64.AppImage"
_pkgname='chatterino'
pkgname="${_pkgname}2-dankerino-bin"
pkgdesc="Dankerino is a fork of Chatterino 2."
pkgver=608965e
pkgrel=1
depends=('qt5-multimedia' 'qt5-base' 'qt5-tools' 'qt5-imageformats' 'boost-libs' 'openssl')
optdepends=('streamlink: For piping streams to video players'
            'pulseaudio: For audio output'
            'gst-plugins-good: For audio output')
arch=('x86_64')
url="https://github.com/Mm2PL/dankerino/"
license=('MIT')
provides=(${_pkgname})
options=(!strip)
conflicts=(
    'chatterino2-git'
    'chatterino2-appimage'
    'chatterino2-nightly-appimage'
    'chatterino2-7tv-git'
    'chatterino2-dankerino-git'
)
source=(
    https://github.com/Mm2PL/dankerino/releases/download/nightly-build/$_appimage
)

sha256sums=(
    SKIP
)

prepare () {
    cd "$srcdir"
    chmod +x $_appimage
    ./$_appimage --appimage-extract
}

package() {
    cd "$srcdir"

    install -Dm755 ../$_appimage "$pkgdir/opt/chatterino/$_appimage"
    install -dm755 "$pkgdir/usr/bin"

    ln -s "/opt/chatterino/$_appimage" "$pkgdir/usr/bin/chatterino"

    install -Dm644 "squashfs-root/com.chatterino.chatterino.desktop" "$pkgdir/usr/share/applications/com.chatterino.chatterino.desktop"
    install -Dm644 "squashfs-root/chatterino.png" "$pkgdir/usr/share/pixmaps/chatterino.png"
}
