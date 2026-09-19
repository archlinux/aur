# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=codepilot-appimage
pkgver=0.67.16
pkgrel=1
pkgdesc="A multi-model AI agent desktop client (AppImage)"
url="https://github.com/op7418/CodePilot"
arch=("x86_64" "aarch64")
depends=("fuse2")
provides=("codepilot")
conflicts=("codepilot" "codepilot-bin")
options=("!strip")
license=("LicenseRef-BSL-1.1")

source_x86_64=("codepilot-appimage-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/CodePilot-${pkgver}-x86_64.AppImage" "codepilot.png::https://raw.githubusercontent.com/op7418/CodePilot/main/build/icon.png" "codepilot.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/codepilot/codepilot.desktop")
source_aarch64=("codepilot-appimage-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/CodePilot-${pkgver}-arm64.AppImage" "codepilot.png::https://raw.githubusercontent.com/op7418/CodePilot/main/build/icon.png" "codepilot.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/codepilot/codepilot.desktop")
sha256sums_x86_64=('3dc81e1076cbbc64ea6bfca809142c75f4b8f8fdf700d9b579a36b19400d82ec'
                   '04c8c070b375f1f0761cb9f0795f09a98969c39201dc651ad46ef61331e66218'
                   '3f8447e95462a0b92e34e63c1b8b8ada7188a64dde9a9d04bf3799f8673aad4b')
sha256sums_aarch64=('b15441a4a86538e35a49c5154690d3f5e6aa1f02842a3659d9e9bcd317cd47a0'
                    '04c8c070b375f1f0761cb9f0795f09a98969c39201dc651ad46ef61331e66218'
                    '3f8447e95462a0b92e34e63c1b8b8ada7188a64dde9a9d04bf3799f8673aad4b')

prepare() {
  if [ "${CARCH}" = "x86_64" ]; then
    chmod +x "${srcdir}/codepilot-appimage-${pkgver}-x86_64.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    chmod +x "${srcdir}/codepilot-appimage-${pkgver}-aarch64.AppImage"
  fi
}

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/codepilot-appimage-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/codepilot-appimage/codepilot.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/codepilot-appimage-${pkgver}-aarch64.AppImage" "${pkgdir}/opt/codepilot-appimage/codepilot.AppImage"
  fi
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/codepilot-appimage/codepilot.AppImage" "${pkgdir}/usr/bin/codepilot"
  install -Dm644 "${srcdir}/codepilot.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/codepilot.png"
  install -Dm644 "${srcdir}/codepilot.desktop" "${pkgdir}/usr/share/applications/codepilot.desktop"
}

