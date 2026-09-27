# Maintainer: Digvijay Mahapatra <mahapatra.digvijay@gmail.com>

pkgname=walt-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A fast terminal wallpaper picker for Hyprland with in-place previews, keyboard-first navigation, and auto-rotation"
arch=('x86_64' 'aarch64')
url="https://github.com/gitfudge0/walt"
license=('MIT')

depends=('hyprpaper' 'xdg-desktop-portal')
optdepends=(
  'xdg-desktop-portal-hyprland: file picker support on Hyprland'
  'xdg-desktop-portal-wlr: file picker support on wlroots compositors'
  'xdg-desktop-portal-kde: file picker support on KDE Plasma'
  'xdg-desktop-portal-gnome: file picker support on GNOME'
  'xdg-desktop-portal-gtk: file picker support (generic GTK fallback)'
)

makedepends=('gendesk')
install="${pkgname}.install"

provides=('walt')
conflicts=('walt' 'walt-git')
options=('!debug')

source_x86_64=(
  "walt-v${pkgver}-linux-x64.tar.gz::https://github.com/gitfudge0/walt/releases/download/v${pkgver}/walt-v${pkgver}-linux-x64.tar.gz"
)
source_aarch64=(
  "walt-v${pkgver}-linux-arm64.tar.gz::https://github.com/gitfudge0/walt/releases/download/v${pkgver}/walt-v${pkgver}-linux-arm64.tar.gz"
)

sha256sums_x86_64=('b286cd8492a587dea66923a4aeec65e29a237c8c1728b1c2c0c06a1910db12ac')
sha256sums_aarch64=('3a12ea08fc88bee4134aa7f8b64f68b50b6569459d26437070db57d92220bc9b')

prepare() {
  gendesk -f -n \
    --pkgname "walt" \
    --name "Walt Wallpaper Picker" \
    --pkgdesc "${pkgdesc}" \
    --exec "walt gui" \
    --categories "Graphics;Utility;" \
    --terminal=false \
    --icon "preferences-desktop-wallpaper"
}

package() {
  install -Dm755 "${srcdir}/walt" "${pkgdir}/usr/bin/walt"
  install -Dm644 "${srcdir}/walt.desktop" "${pkgdir}/usr/share/applications/walt.desktop"
}
