# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=aider-desk-appimage
pkgver=0.82.0
pkgrel=1
pkgdesc="Transparent, steerable AI orchestration platform for software engineers (AppImage)"
url="https://github.com/hotovo/aider-desk"
arch=("x86_64" "aarch64")
depends=("fuse2")
provides=("aider-desk")
conflicts=("aider-desk")
options=("!strip")
license=("Apache-2.0")

source_x86_64=("aider-desk-appimage-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/aider-desk-${pkgver}-x86_64.AppImage" "aider-desk.png::https://raw.githubusercontent.com/hotovo/aider-desk/main/build/icon.png" "aider-desk.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/aider-desk/aider-desk.desktop")
source_aarch64=("aider-desk-appimage-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/aider-desk-${pkgver}-arm64.AppImage" "aider-desk.png::https://raw.githubusercontent.com/hotovo/aider-desk/main/build/icon.png" "aider-desk.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/aider-desk/aider-desk.desktop")
sha256sums_x86_64=('657395a9cb4111c55b41cb90790c1502006d7b5db35cf189d72d742cd57e032b'
                   '5154bb7bfefbe1b93fe94fbc44de529ee59b5b7ceb07dc60b9d748c7857efbc1'
                   '2bf07bf24eaaf3710a63ed5ab1208eb6143b27b9ed3f73de9c865fb3bf59204b')
sha256sums_aarch64=('bfcff84cc09d76bb223436bb8abc0211032db596bbba815b9eadb890f032e1b9'
                    '5154bb7bfefbe1b93fe94fbc44de529ee59b5b7ceb07dc60b9d748c7857efbc1'
                    '2bf07bf24eaaf3710a63ed5ab1208eb6143b27b9ed3f73de9c865fb3bf59204b')

prepare() {
  if [ "${CARCH}" = "x86_64" ]; then
    chmod +x "${srcdir}/aider-desk-appimage-${pkgver}-x86_64.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    chmod +x "${srcdir}/aider-desk-appimage-${pkgver}-aarch64.AppImage"
  fi
}

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/aider-desk-appimage-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/aider-desk-appimage/aider-desk.AppImage"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/aider-desk-appimage-${pkgver}-aarch64.AppImage" "${pkgdir}/opt/aider-desk-appimage/aider-desk.AppImage"
  fi
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/aider-desk-appimage/aider-desk.AppImage" "${pkgdir}/usr/bin/aider-desk"
  install -Dm644 "${srcdir}/aider-desk.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/aider-desk.png"
  install -Dm644 "${srcdir}/aider-desk.desktop" "${pkgdir}/usr/share/applications/aider-desk.desktop"
}

