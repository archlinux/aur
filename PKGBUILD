# Maintainer: Alex <alex@example.com>
pkgname=melody-player
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern Spotify-inspired desktop music player"
arch=('x86_64')
url="https://github.com/johnsmith8736/melody-player"
license=('MIT')
depends=('electron37' 'alsa-lib' 'gtk3' 'libxss' 'nss' 'libnotify' 'libxtst' 'xdg-utils')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    # Create directories
    mkdir -p "$pkgdir/usr/share/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Copy app files from the extracted source directory
    cp "$srcdir"/index.html "$srcdir"/styles.css "$srcdir"/app.js "$srcdir"/main.js "$srcdir"/preload.js "$srcdir"/package.json "$srcdir"/icon.png "$pkgdir/usr/share/$pkgname/"

    # Install icon
    cp "$srcdir"/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    # Create launcher script
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec electron37 /usr/share/melody-player "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Create .desktop file
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Melody
Comment=Modern Spotify-inspired music player
Exec=$pkgname %U
Icon=$pkgname
Terminal=false
Type=Application
Categories=Audio;Music;Player;
MimeType=audio/mpeg;audio/x-wav;audio/ogg;audio/flac;audio/x-vorbis+ogg;audio/x-flac;
StartupWMClass=Melody
EOF
}
