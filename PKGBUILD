pkgname=better-github-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="better github desktop app (prebuilt appimage)"
arch=('x86_64')
url="https://github.com/krishkalaria12/better-github-desktop"
license=('MIT')
depends=('fuse2')
options=(!strip)
source=(
  "better-github.AppImage::https://github.com/krishkalaria12/better-github-desktop/releases/download/v${pkgver}/better-github_1.0.0_amd64.AppImage"
  "better-github.png::https://raw.githubusercontent.com/krishkalaria12/better-github-desktop/v${pkgver}/apps/desktop/src-tauri/icons/128x128.png"
)
sha256sums=('016b378d9e83b6fa011780a23cbddaab88235a28da078e13d890aa56407db19d'
            'b0992f41bb799d686939d16e1eabbe83a03e7997fab3072266dd8398319a3ec6')

package() {
  install -Dm755 "${srcdir}/better-github.AppImage" "${pkgdir}/opt/better-github/better-github.AppImage"
  install -Dm644 "${srcdir}/better-github.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/better-github.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/better-github.desktop" << 'DESKTOP'
[Desktop Entry]
Type=Application
Name=Better GitHub
Comment=Better GitHub desktop app
Exec=better-github
Icon=better-github
Categories=Development;
Terminal=false
DESKTOP

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/better-github" << 'SH'
#!/bin/sh
exec /opt/better-github/better-github.AppImage "$@"
SH
}
