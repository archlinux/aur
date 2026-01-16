# Maintainer: 0xpix

pkgname=hei-datahub
pkgver=0.64.0-beta
pkgrel=1
pkgdesc="Lightweight local data hub with TUI for managing datasets"
arch=('x86_64')
url="https://github.com/0xpix/Hei-DataHub"
license=('MIT')
depends=('fuse2')
options=('!strip')

source=(
  "HeiDataHub-${pkgver}-x86_64.AppImage::https://github.com/0xpix/Hei-DataHub/releases/download/${pkgver}/HeiDataHub-${pkgver}-x86_64.AppImage"
  "hei-datahub.desktop"
  "hei-datahub.png::https://raw.githubusercontent.com/0xpix/Hei-DataHub/main/assets/png/icon_1024.png"
  "LICENSE::https://raw.githubusercontent.com/0xpix/Hei-DataHub/main/LICENSE"
)

sha256sums=(
  'SKIP'
  'PUT_DESKTOP_SHA256'
  'PUT_ICON_SHA256'
  'PUT_LICENSE_SHA256'
)

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm755 "HeiDataHub-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/HeiDataHub.AppImage"

  cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
exec /opt/hei-datahub/HeiDataHub.AppImage "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "hei-datahub.desktop" "${pkgdir}/usr/share/applications/hei-datahub.desktop"
  install -Dm644 "hei-datahub.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hei-datahub.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
