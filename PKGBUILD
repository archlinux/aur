# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=signboard-appimage
pkgver=1.7.4
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
sha256sums_x86_64=('dab8fd5308007319508f4214e750e9b85d7120dfa0d1ef28a132646e2a1a7813'
                   '798a7a47642b751b600bf50f20badf41eec6280b90fd1e16fb3924537f7c1836'
                   'c9c504cabbf47ad1c214d605890777be8399fef4f669c36d31b7e57a82dd9873')
sha256sums_aarch64=('691cd25145b675ccb699270ac9902ed2a9854a13dd021bb532d231d7ef2cecf5'
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

