# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=dm-appimage
pkgver=0.9.0
pkgrel=1
pkgdesc="Download manager with many connections, resume, and a queue (AppImage)"
url="https://github.com/pranavo72bex/Easy-Download-Manager"
arch=("x86_64" "aarch64")
depends=("fuse2" "xdg-utils")
optdepends=("yt-dlp: downloads from sites that serve video through a player" "noto-fonts-cjk: names in Chinese, Japanese and Korean")
provides=("dm")
conflicts=("dm")
options=("!strip")
license=("MIT")

source_x86_64=("dm-appimage-${pkgver}-x86_64.AppImage::${url}/releases/download/desktop-v${pkgver}/dm_${pkgver}_x86_64.AppImage" "dm.png::https://raw.githubusercontent.com/pranavo72bex/Easy-Download-Manager/main/desktop/crates/dm-desktop/icons/128x128.png" "dm.desktop::https://raw.githubusercontent.com/pranavo72bex/Easy-Download-Manager/main/desktop/packaging/dm.desktop")
source_aarch64=("dm-appimage-${pkgver}-aarch64.AppImage::${url}/releases/download/desktop-v${pkgver}/dm_${pkgver}_aarch64.AppImage" "dm.png::https://raw.githubusercontent.com/pranavo72bex/Easy-Download-Manager/main/desktop/crates/dm-desktop/icons/128x128.png" "dm.desktop::https://raw.githubusercontent.com/pranavo72bex/Easy-Download-Manager/main/desktop/packaging/dm.desktop")
sha256sums_x86_64=('bae2cb025b5a24ec9a3523577c78a741a4706cd0d5512d8f02ab4691728c3464'
                   '6cfe62be3bd360c122ae98af86d1eb096f64fc49a58e578de2c0ff3154699b2a'
                   'b3c89656576d20d5b5ceda5c0535640cfa70fbc70a97cf8909ed847267272913')
sha256sums_aarch64=('868d1576073a6b56edbd436d861706b6971dff2a61b9e9b21bdf7d3560c5bc1d'
                    '6cfe62be3bd360c122ae98af86d1eb096f64fc49a58e578de2c0ff3154699b2a'
                    'b3c89656576d20d5b5ceda5c0535640cfa70fbc70a97cf8909ed847267272913')

prepare() {
  if [ "${CARCH}" = "x86_64" ]; then
    chmod +x "${srcdir}/dm-appimage-${pkgver}-x86_64.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    chmod +x "${srcdir}/dm-appimage-${pkgver}-aarch64.AppImage"
  fi
}

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/dm-appimage-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/dm-appimage/dm.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/dm-appimage-${pkgver}-aarch64.AppImage" "${pkgdir}/opt/dm-appimage/dm.AppImage"
  fi
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/dm-appimage/dm.AppImage" "${pkgdir}/usr/bin/dm"
  install -Dm644 "${srcdir}/dm.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dm.png"
  install -Dm644 "${srcdir}/dm.desktop" "${pkgdir}/usr/share/applications/dm.desktop"
}

