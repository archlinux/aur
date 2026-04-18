pkgname=peekoo-bin
pkgver=0.1.32
pkgrel=1
pkgdesc="Desktop AI pet and productivity companion"
arch=('x86_64')
url="https://github.com/feed-mob/peekoo-ai"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'libnotify')
optdepends=('xdg-utils: open external links')
options=('!strip')
source=(
  "https://github.com/feed-mob/peekoo-ai/releases/download/v${pkgver}/Peekoo_${pkgver}_amd64.AppImage"
  'peekoo.desktop'
  'peekoo.png'
)
sha256sums=(
  'e194cec6564bca6e495e58f062bd96768efeb3a2afc8d84898f14bedb848102d'
  'SKIP'
  'SKIP'
)

prepare() {
  chmod +x "${srcdir}/Peekoo_${pkgver}_amd64.AppImage"
  "${srcdir}/Peekoo_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/peekoo-desktop-tauri" "${pkgdir}/usr/bin/peekoo"
  install -Dm644 "${srcdir}/peekoo.desktop" "${pkgdir}/usr/share/applications/peekoo.desktop"
  install -Dm644 "${srcdir}/peekoo.png" "${pkgdir}/usr/share/pixmaps/peekoo.png"
}
