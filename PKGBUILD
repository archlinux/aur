pkgname=peekoo-bin
pkgver=0.1.6
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
  'bd96fa5a8719d4bc9ae69307876108b930632bb5dab7692718971f1095cfc400'
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
