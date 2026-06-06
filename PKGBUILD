# Maintainer: Tradicted <info@tradicted.com>
pkgname=tradicted-trading-journal-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Free open-source desktop trading journal by Tradicted"
arch=('x86_64')
url="https://tradicted.com"
license=('MIT')
depends=('fuse2')
options=('!strip')
source=("https://github.com/tradicted/tradicted-journal/releases/download/v${pkgver}/tradicted-trading-journal-${pkgver}.AppImage")
sha256sums=('3b31b00e216b08bdd5fe6f50418394505f2356f5e8e53c5a4e0e7a18124b7308')

package() {
    install -Dm755 "${srcdir}/tradicted-trading-journal-${pkgver}.AppImage" \
        "${pkgdir}/opt/tradicted-trading-journal/tradicted-trading-journal.AppImage"

    # Launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/tradicted-trading-journal" <<EOF
#!/bin/sh
exec /opt/tradicted-trading-journal/tradicted-trading-journal.AppImage "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/tradicted-trading-journal"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/tradicted-trading-journal.desktop" <<EOF
[Desktop Entry]
Name=Tradicted Trading Journal
Comment=Free open-source desktop trading journal
Exec=tradicted-trading-journal %U
Icon=tradicted-trading-journal
Type=Application
Categories=Office;Finance;
EOF
}
