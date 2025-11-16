# Maintainer: Raul <raul09alazovi@gmail.com>

pkgname=noctune
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern local music player with a Spotify-inspired UI. Built with Avalonia and LibVLC."
arch=('x86_64')
url="https://github.com/raula09/NoctuneMusicPlayer"
license=('MIT')
depends=('ffmpeg' 'libvlc' 'vlc')
makedepends=('unzip')
options=('!strip' '!debug' '!compress')
source=(
    "$pkgname-$pkgver.zip::https://github.com/raula09/NoctuneMusicPlayer/releases/download/v$pkgver/Noctune-linux-x64.zip"
    "noctune.desktop"
    "noctune.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"

    unzip "$srcdir/$pkgname-$pkgver.zip" -d "$pkgdir/opt/$pkgname"

    cat <<EOF > "$pkgdir/usr/bin/noctune"
#!/bin/bash
exec /opt/noctune/MusicPlayerApp "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/noctune"

    install -Dm644 "$srcdir/noctune.desktop" \
        "$pkgdir/usr/share/applications/noctune.desktop"

    install -Dm644 "$srcdir/noctune.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/noctune.png"
}
