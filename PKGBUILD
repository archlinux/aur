# Maintainer: Jordan Sluiter <jordan.sluiter@icloud.com>
pkgname=shrimp-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Self-hosted AI productivity assistant — pre-built AppImage"
arch=('x86_64')
url="https://github.com/TheSingularis/shrimp"
license=('MIT')
depends=()
provides=('shrimp')
conflicts=('shrimp')
source=("SHRIMP-${pkgver}.AppImage::https://github.com/TheSingularis/shrimp/releases/download/v${pkgver}/SHRIMP-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    install -Dm755 "SHRIMP-${pkgver}.AppImage" "${pkgdir}/usr/lib/shrimp-bin/shrimp.AppImage"

    # Wrapper script so `shrimp` works from PATH
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/shrimp" <<'EOF'
#!/usr/bin/env sh
exec /usr/lib/shrimp-bin/shrimp.AppImage --appimage-extract-and-run "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/shrimp"

    # Desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/shrimp.desktop" <<'EOF'
[Desktop Entry]
Name=SHRIMP
Comment=Self-hosted AI productivity assistant
Exec=/usr/bin/shrimp %U
Icon=shrimp
Type=Application
Categories=Utility;Office;
EOF
}
