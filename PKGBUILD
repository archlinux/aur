# Maintainer: Your Name <your@email.com>

pkgname=xpanel-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Finalmouse XPanel Desktop AppImage with udev rules and desktop entry"
arch=(x86_64)
url="https://github.com/teamfinalmouse/xpanel-desktop-public"
license=(proprietary)
depends=(glibc zlib fuse2 hicolor-icon-theme)
options=(!strip) # AppImage won't work stripped

source=(
  "https://github.com/teamfinalmouse/xpanel-desktop-public/releases/download/v${pkgver}/xpanel-desktop-${pkgver}.AppImage"
  "https://raw.githubusercontent.com/teamfinalmouse/xpanel-linux-permissions/main/99-finalmouse.rules"
  "xpanel.desktop"
)

sha256sums=(
  '824318a591f5d1519d46769a83742b41948a3f56b2d855e1032ae1c6404ed3c7'
  'b2e4708d59ab5a7ec63922c77da5bdd604f9bd600e3dc979a7fa17eadb4cd6cb'
  'SKIP'  # desktop file checksum
)

prepare() {
  chmod +x "${srcdir}/xpanel-desktop-${pkgver}.AppImage"
  mv "${srcdir}/xpanel-desktop-${pkgver}.AppImage" "${srcdir}/xpanel"

  "${srcdir}/xpanel" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/xpanel" "${pkgdir}/usr/bin/xpanel"
  install -Dm644 "${srcdir}/99-finalmouse.rules" "${pkgdir}/usr/lib/udev/rules.d/99-finalmouse.rules"
  install -Dm644 "${srcdir}/xpanel.desktop" "${pkgdir}/usr/share/applications/xpanel.desktop"
  install -Dm644 "${srcdir}/squashfs-root/xpanel-desktop.png" "${pkgdir}/usr/share/icons/xpanel-desktop.png"
}
