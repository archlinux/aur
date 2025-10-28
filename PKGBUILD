# PKGBUILD
pkgname=opencode-ui-bin
pkgver=0.1.0
pkgrel=0
pkgdesc="OpenCode Desktop Client"
arch=('x86_64')
url="https://github.com/marmotz-dev/opencode-ui"
license=('CC-BY-NC-SA-4.0')
depends=('opencode-bin')
source=(
  "https://github.com/marmotz-dev/opencode-ui/releases/download/v${pkgver}/opencode-ui-${pkgver}.AppImage"
)
sha256sums=(
  '4cb773711784f19b8c2223964127700a73e29babe81b70179e3b946c9d0b57f5'
)

package() {
    ./opencode-ui-${pkgver}.AppImage --appimage-extract
    install -dm755 "${pkgdir}/opt/opencode-ui"
    cp -r squashfs-root/* "${pkgdir}/opt/opencode-ui/"
    find "${pkgdir}/opt/opencode-ui/locales" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/opencode-ui/locales" -type f -exec chmod 644 {} \;
    find "${pkgdir}/opt/opencode-ui/resources" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/opencode-ui/resources" -type f -exec chmod 644 {} \;
    find "${pkgdir}/opt/opencode-ui/usr" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/opencode-ui/usr" -type f -exec chmod 644 {} \;

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/opencode-ui/AppRun "${pkgdir}/usr/bin/opencode-ui"

    install -Dm644 squashfs-root/usr/share/icons/hicolor/16x16/apps/opencode-ui.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/opencode-ui.png"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/32x32/apps/opencode-ui.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/opencode-ui.png"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/48x48/apps/opencode-ui.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/opencode-ui.png"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/64x64/apps/opencode-ui.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/opencode-ui.png"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/128x128/apps/opencode-ui.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/opencode-ui.png"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/opencode-ui.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/opencode-ui.png"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/opencode-ui.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/opencode-ui.png"
    install -Dm644 squashfs-root/opencode-ui.desktop "${pkgdir}/usr/share/applications/opencode-ui.desktop"
    sed -i 's/Exec=.*/Exec=opencode-ui %U/' "${pkgdir}/usr/share/applications/opencode-ui.desktop"
}