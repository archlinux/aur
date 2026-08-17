# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=aperant-appimage
pkgver=2.7.6
pkgrel=1
pkgdesc="Autonomous multi-session AI coding (AppImage)"
url="https://github.com/AndyMik90/Aperant"
arch=("x86_64")
depends=("fuse2")
provides=("aperant" "auto-claude")
conflicts=("aperant")
options=("!strip")
license=("AGPL3")

source=("aperant-appimage-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Auto-Claude-${pkgver}-linux-x86_64.AppImage" "aperant.png::https://raw.githubusercontent.com/AndyMik90/Aperant/main/apps/frontend/resources/icons/256x256.png" "aperant.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/aperant/aperant.desktop")
sha256sums=('21832b15cb6420d56dc57ad2738a76a8ceee15342aac618bc1dc060cffb346e0'
            '8bcebaf7cfb1997ade68fa8dc18ff8c59c545f7609502d4479abe2713c95bbce'
            '8f751ed3709c0052b483f138cf67d1e7b0c91112fd5131a8885c0dde8bd40145')

prepare() {
  chmod +x "${srcdir}/aperant-appimage-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/aperant-appimage-${pkgver}.AppImage" "${pkgdir}/opt/aperant-appimage/aperant.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/aperant-appimage/aperant.AppImage" "${pkgdir}/usr/bin/aperant"
  ln -sf "/opt/aperant-appimage/aperant.AppImage" "${pkgdir}/usr/bin/auto-claude"
  install -Dm644 "${srcdir}/aperant.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/aperant.png"
  install -Dm644 "${srcdir}/aperant.desktop" "${pkgdir}/usr/share/applications/aperant.desktop"
}

