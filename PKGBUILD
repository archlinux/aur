# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=signboard-appimage
pkgver=1.7.5
pkgrel=1
pkgdesc="A local-first kanban app that writes Markdown files (AppImage)"
url="https://github.com/cdevroe/signboard"
arch=("x86_64" "aarch64")
depends=("fuse2")
provides=("signboard")
conflicts=("signboard")
options=("!strip")
license=("MIT")

source_x86_64=("signboard-appimage-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/signboard_${pkgver}_linux_x86_64.AppImage" "signboard.png::https://raw.githubusercontent.com/cdevroe/signboard/main/build/icons/512x512.png" "signboard.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/signboard/signboard.desktop")
source_aarch64=("signboard-appimage-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/signboard_${pkgver}_linux_arm64.AppImage" "signboard.png::https://raw.githubusercontent.com/cdevroe/signboard/main/build/icons/512x512.png" "signboard.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/signboard/signboard.desktop")
sha256sums_x86_64=('cd41573b42022aa24b64987c76ccd61550e4d68d14a8369974db0192cd1b72d1'
                   '798a7a47642b751b600bf50f20badf41eec6280b90fd1e16fb3924537f7c1836'
                   'c9c504cabbf47ad1c214d605890777be8399fef4f669c36d31b7e57a82dd9873')
sha256sums_aarch64=('20f036b07822af1d8f69b2fb856aee3d524f0c51906131ad41567b08dd2a3b26'
                    '798a7a47642b751b600bf50f20badf41eec6280b90fd1e16fb3924537f7c1836'
                    'c9c504cabbf47ad1c214d605890777be8399fef4f669c36d31b7e57a82dd9873')

prepare() {
  if [ "${CARCH}" = "x86_64" ]; then
    chmod +x "${srcdir}/signboard-appimage-${pkgver}-x86_64.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    chmod +x "${srcdir}/signboard-appimage-${pkgver}-aarch64.AppImage"
  fi
}

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/signboard-appimage-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/signboard-appimage/signboard.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/signboard-appimage-${pkgver}-aarch64.AppImage" "${pkgdir}/opt/signboard-appimage/signboard.AppImage"
  fi
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/signboard-appimage/signboard.AppImage" "${pkgdir}/usr/bin/signboard"
  install -Dm644 "${srcdir}/signboard.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/signboard.png"
  install -Dm644 "${srcdir}/signboard.desktop" "${pkgdir}/usr/share/applications/signboard.desktop"
}

