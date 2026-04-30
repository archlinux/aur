# Maintainer: Jordan Sluiter <jordan.sluiter@icloud.com>
pkgname=shrimp-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Self-hosted AI productivity assistant — pre-built AppImage"
arch=('x86_64')
url="https://github.com/TheSingularis/shrimp"
license=('MIT')
depends=('fuse2')
provides=('shrimp')
conflicts=('shrimp')
source=("SHRIMP-${pkgver}.AppImage::https://github.com/TheSingularis/shrimp/releases/download/v${pkgver}/SHRIMP-${pkgver}.AppImage")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    install -Dm755 "SHRIMP-${pkgver}.AppImage" "${pkgdir}/usr/lib/shrimp-bin/shrimp.AppImage"

    # Wrapper script so `shrimp` works from PATH
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/shrimp" <<'EOF'
#!/usr/bin/env sh
exec /usr/lib/shrimp-bin/shrimp.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/shrimp"

    # Desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/shrimp.desktop" <<'EOF'
[Desktop Entry]
Name=SHRIMP
Comment=Self-hosted AI productivity assistant
Exec=/usr/lib/shrimp-bin/shrimp.AppImage %U
Icon=shrimp
Type=Application
Categories=Utility;Office;
EOF
}
