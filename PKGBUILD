# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=mochi-recorder-appimage
pkgver=1.0.22
pkgrel=2
pkgdesc="A modern Linux screen recorder with smooth animations like Screen Studio (AppImage)"
url="https://github.com/4ndreello/mochi-recorder"
arch=("x86_64")
depends=("fuse2")
options=("!strip")
license=("MIT")

source=("mochi-recorder-appimage-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Mochi-${pkgver}.AppImage" "mochi-recorder.png::https://raw.githubusercontent.com/4ndreello/mochi-recorder/main/src/renderer/assets/icon.png" "mochi-recorder.desktop")
sha256sums=('76228675aae35065c09dc000b9a2e4654669fae0ae3ea2b811354147d42a22cd'
            'dee91a144d48a379ec9e6864f3fa4d515f138fe0d33fa65cf2a1fbe2fe1decd7'
            'c604dc090094e2e4354a50e76583fc64e72e412410c54cda268a351462f4216e')

prepare() {
  chmod +x "${srcdir}/mochi-recorder-appimage-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/mochi-recorder-appimage-${pkgver}.AppImage" "${pkgdir}/opt/mochi-recorder-appimage/mochi.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/mochi-recorder-appimage/mochi.AppImage" "${pkgdir}/usr/bin/mochi"
  install -Dm644 "${srcdir}/mochi-recorder.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mochi-recorder.png"
  install -Dm644 "${srcdir}/mochi-recorder.desktop" "${pkgdir}/usr/share/applications/mochi-recorder.desktop"
}

