# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=marky-appimage
pkgver=0.1.3
pkgrel=1
pkgdesc="Fast native markdown viewer with live reload and folder workspaces (AppImage)"
url="https://github.com/GRVYDEV/marky"
arch=("x86_64" "aarch64")
depends=("fuse2")
options=("!strip")
license=("Apache-2.0")

source_x86_64=("marky-appimage-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/Marky_${pkgver}_amd64.AppImage" "marky.png::https://raw.githubusercontent.com/GRVYDEV/marky/main/src-tauri/icons/128x128@2x.png" "marky.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/marky/marky.desktop")
source_aarch64=("marky-appimage-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/Marky_${pkgver}_arm64.AppImage" "marky.png::https://raw.githubusercontent.com/GRVYDEV/marky/main/src-tauri/icons/128x128@2x.png" "marky.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/marky/marky.desktop")
sha256sums_x86_64=('d54a17866e9599774aad802a32395edb057ee13a3101a93efb008e2b3124d7b0'
                   '6c7660390d65217fe8de0892862254f47aee77e0af7096c75b8bfe168c5403f7'
                   '983e2bc77f9836a8cb871e2b7e980b3bd1ea42b9f48124dd7114bda38ae2c537')
sha256sums_aarch64=('c44b89f720ea91766281d179ff7676acf66ea5406deada1f37135b371b99bc5b'
                    '6c7660390d65217fe8de0892862254f47aee77e0af7096c75b8bfe168c5403f7'
                    '983e2bc77f9836a8cb871e2b7e980b3bd1ea42b9f48124dd7114bda38ae2c537')

prepare() {
  if [ "${CARCH}" = "x86_64" ]; then
    chmod +x "${srcdir}/marky-appimage-${pkgver}-x86_64.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    chmod +x "${srcdir}/marky-appimage-${pkgver}-aarch64.AppImage"
  fi
}

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/marky-appimage-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/marky-appimage/marky.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/marky-appimage-${pkgver}-aarch64.AppImage" "${pkgdir}/opt/marky-appimage/marky.AppImage"
  fi
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/marky-appimage/marky.AppImage" "${pkgdir}/usr/bin/marky"
  install -Dm644 "${srcdir}/marky.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/marky.png"
  install -Dm644 "${srcdir}/marky.desktop" "${pkgdir}/usr/share/applications/marky.desktop"
}

