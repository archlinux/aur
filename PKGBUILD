# Maintainer: Ashley <info@meisgaming.net>
pkgname=league-of-gays
pkgver=0.1.0
pkgrel=5
pkgdesc="League of Gays — self-hosted MOBA launcher"
arch=('x86_64')
url="https://lol.meisgaming.net"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'xdg-utils' 'libx11')
provides=('league-of-gays')
conflicts=('league-of-gays')
source=("${pkgname}-launcher-${pkgver}.tar.gz::https://lol.meisgaming.net/launcher/${pkgname}-launcher-${pkgver}.tar.gz")
sha256sums=('984ba2a0fe89ceb5ef70fbd2619be0ad8ec149f1cafb74b0ef4fd22f4e5721aa')

package() {
    local src_dir="$srcdir/${pkgname}-launcher-${pkgver}"

    install -dm755 "$pkgdir/opt/league-of-gays"
    cp -r "$src_dir/." "$pkgdir/opt/league-of-gays/"

    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/league-of-gays/league-of-gays "$pkgdir/usr/bin/league-of-gays"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/league-of-gays.desktop" << 'EOF'
[Desktop Entry]
Name=League of Gays
Exec=/usr/bin/league-of-gays %U
Icon=league-of-gays
Type=Application
Categories=Game;
StartupWMClass=league-of-gays
MimeType=x-scheme-handler/log;
EOF

    # Icon (256px, optional — falls vorhanden)
    local icon="$src_dir/resources/app/renderer/assets/icon.png"
    if [ -f "$icon" ]; then
        install -Dm644 "$icon" \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/league-of-gays.png"
    fi

    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
