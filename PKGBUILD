pkgname=hyprcord-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Hyprcord a custom discord client"
arch=('x86_64')
url="https://github.com/Bebbesi/HyprCord"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=('hyprcord')
conflicts=('hyprcord')

source=("https://github.com/Bebbesi/HyprCord/releases/download/hyprcord/Hyprcord-1.0.4.AppImage")
sha256sums=('a921e180b78bee14b0c56e9ffc1215e6a6e11f5a7cbc6326752970aed858fe73')

prepare() {
  chmod +x Hyprcord-${pkgver}.AppImage
  ./Hyprcord-${pkgver}.AppImage --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/hyprcord"
  cp -r squashfs-root/* "${pkgdir}/opt/hyprcord"

  install -Dm755 "${pkgdir}/opt/hyprcord/AppRun" \
    "${pkgdir}/usr/bin/hyprcord"

  install -Dm644 squashfs-root/hyprcord.desktop \
    "${pkgdir}/usr/share/applications/hyprcord.desktop" 2>/dev/null || true

  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/*.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hyprcord.png" 2>/dev/null || true
}
