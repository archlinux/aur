# Maintainer: IlNinjaDiBattipaglia <fogliadonato2@gmail.com>
pkgname=abs-flutter-bin
pkgver=1.8.5
pkgrel=1
pkgdesc="Unofficial cross-platform client for Audiobookshelf (Buchable)"
arch=('x86_64')
url="https://github.com/Vito0912/abs_flutter"
license=('GPL-3.0-only')
depends=('gtk3' 'libsecret' 'mpv')
provides=('abs-flutter')
conflicts=('buchable' 'buchable-git')
source=("linux-release-${pkgver}.zip::https://github.com/Vito0912/abs_flutter/releases/download/v${pkgver}/linux-release-${pkgver}.zip"
        "abs-flutter.png::https://raw.githubusercontent.com/Vito0912/abs_flutter/main/android/app/src/main/res/mipmap-xxxhdpi/launcher_icon.png")
sha256sums=('SKIP'
            'SKIP')
package() {
    install -dm755 "$pkgdir/opt/abs-flutter"
    cp -r "$srcdir/abs_flutter" "$pkgdir/opt/abs-flutter/"
    cp -r "$srcdir/lib"         "$pkgdir/opt/abs-flutter/"
    cp -r "$srcdir/data"        "$pkgdir/opt/abs-flutter/"
    chmod +x "$pkgdir/opt/abs-flutter/abs_flutter"
    install -Dm644 "$srcdir/abs-flutter.png" "$pkgdir/usr/share/pixmaps/abs-flutter.png"
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/abs-flutter" << 'EOF'
#!/bin/bash
GDK_BACKEND=x11 /opt/abs-flutter/abs_flutter "$@"
EXIT_CODE=$?
pkill -f "/opt/abs-flutter/abs_flutter" 2>/dev/null
exit $EXIT_CODE
EOF
    chmod +x "$pkgdir/usr/bin/abs-flutter"
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/abs-flutter.desktop" << DESKTOP
[Desktop Entry]
Name=Buchable
Comment=Audiobookshelf client
Exec=abs-flutter
Icon=abs-flutter
Type=Application
Categories=Audio;
StartupWMClass=Buchable
DESKTOP
}
