pkgname=peekoo-bin
pkgver=0.1.21
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
  '5f1b0de0d4a43b75ae90271714301b9a1cc4fb884fa6f63c255ca76a9da46e15'
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
