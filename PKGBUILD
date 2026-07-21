# Maintainer: YalishannaZhou <yalishannazhouaz@gmail.com>

pkgname=archipelagolauncher-bin
pkgver=0.6.7
pkgrel=1
pkgdesc="Archipelago Multiworld Randomizer Launcher"
arch=('x86_64')
license=('MIT')
depends=('xclip')
options=('!debug')
source=("https://github.com/ArchipelagoMW/Archipelago/releases/download/${pkgver}/Archipelago_${pkgver}_linux-${CARCH}.tar.gz")
sha256sums=('b0d0ce90b5a9a0f1213991d37e1eb58f093e3c4eba2dfcd565bfbb79ac2a49fc')
url=https://archipelago.gg/

package() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🌍 Connecting worlds..."
    echo "🎲 Generating package..."
    echo "📦 Placing progression items..."
    echo "I'm so obsessed with you- I'm so obsessed!"
    echo "My AURs be like: dhlkjdjklhdafsjsajkd"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    install -dm755 "$pkgdir/opt/archipelago"

    # Copy the application
    cp -a "$srcdir/Archipelago/." "$pkgdir/opt/archipelago/"

    # Command-line launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/archipelagolauncher" <<'EOF'
#!/bin/sh
exec /opt/archipelago/ArchipelagoLauncher "$@"
EOF

    # Desktop icon
    install -Dm644 \
        "$srcdir/Archipelago/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/archipelagolauncher.png"

    # Desktop entry
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/archipelagolauncher.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Archipelago Launcher
Comment=Multiworld Randomizer Launcher
Exec=archipelagolauncher
Icon=archipelagolauncher
Terminal=false
Categories=Game;
Keywords=Archipelago;Randomizer;Multiworld;
StartupNotify=true
EOF
}
