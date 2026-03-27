# Maintainer: Regaan <contact@rothackers.com>
pkgname=wshawk
pkgver=4.0.0
pkgrel=1
pkgdesc="Enterprise-grade WebSocket Security Scanner & Web Pentest Toolkit"
arch=('x86_64')
url="https://wshawk.rothackers.com"
license=('AGPL3')
depends=('hicolor-icon-theme')
provides=('wshawk')

source=("wshawk-${pkgver}.AppImage::https://github.com/regaan/wshawk/releases/download/v${pkgver}/wshawk-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    chmod +x "${srcdir}/wshawk-${pkgver}.AppImage"

    # Extract AppImage
    "${srcdir}/wshawk-${pkgver}.AppImage" --appimage-extract

    install -d "${pkgdir}/opt"
    mv squashfs-root "${pkgdir}/opt/wshawk"

    # Binary symlink
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/wshawk/AppRun" "${pkgdir}/usr/bin/wshawk"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/wshawk.desktop" <<EOF
[Desktop Entry]
Name=WSHawk
Exec=/usr/bin/wshawk
Icon=wshawk
Type=Application
Categories=Development;Security;
EOF

    # Icon (optional)
    install -Dm644 "${pkgdir}/opt/wshawk/wshawk.png" \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wshawk.png" || true
}