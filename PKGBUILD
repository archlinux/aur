# Maintainer: Your Name <your@email.com>

pkgname=xpanel-bin
pkgver=1.1.1
pkgrel=2
pkgdesc="Finalmouse XPanel Desktop AppImage with udev rules and desktop entry"
arch=(x86_64)
url="https://github.com/teamfinalmouse/xpanel-desktop-public"
license=(proprietary)
depends=(glibc zlib fuse2 hicolor-icon-theme)
options=(!strip) # AppImage won't work stripped

source=(
  "https://github.com/teamfinalmouse/xpanel-desktop-public/releases/download/v${pkgver}/xpanel-desktop-${pkgver}.AppImage"
  "https://raw.githubusercontent.com/teamfinalmouse/xpanel-linux-permissions/49ba1bf19e7d1f05306baaf72e4514c1f12f139a/70-finalmouse.rules"
  "xpanel.desktop"
)

sha256sums=(
  '824318a591f5d1519d46769a83742b41948a3f56b2d855e1032ae1c6404ed3c7'
  '581c65d87d95349b5c46b809b037163e69f7b40915383de11ab9bc59203a257b'
  'SKIP'  # desktop file checksum
)

prepare() {
  chmod +x "${srcdir}/xpanel-desktop-${pkgver}.AppImage"
  mv "${srcdir}/xpanel-desktop-${pkgver}.AppImage" "${srcdir}/xpanel"

  "${srcdir}/xpanel" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/xpanel" "${pkgdir}/usr/bin/xpanel"
  install -Dm644 "${srcdir}/70-finalmouse.rules" "${pkgdir}/usr/lib/udev/rules.d/70-finalmouse.rules"
  install -Dm644 "${srcdir}/xpanel.desktop" "${pkgdir}/usr/share/applications/xpanel.desktop"
  install -Dm644 "${srcdir}/squashfs-root/xpanel-desktop.png" "${pkgdir}/usr/share/icons/xpanel-desktop.png"
}
