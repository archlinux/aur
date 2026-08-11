# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=mochi-recorder-appimage
pkgver=1.0.22
pkgrel=1
pkgdesc="A modern Linux screen recorder with smooth animations like Screen Studio (AppImage)"
url="https://github.com/4ndreello/mochi-recorder"
arch=("x86_64")
depends=("fuse2")
options=("!strip")
license=("MIT")

source=("mochi-recorder-appimage-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Mochi-${pkgver}.AppImage" "mochi-recorder.png::https://raw.githubusercontent.com/4ndreello/mochi-recorder/main/src/renderer/assets/icon.png")
sha256sums=('76228675aae35065c09dc000b9a2e4654669fae0ae3ea2b811354147d42a22cd'
            'dee91a144d48a379ec9e6864f3fa4d515f138fe0d33fa65cf2a1fbe2fe1decd7')

prepare() {
  chmod +x "${srcdir}/mochi-recorder-appimage-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/mochi-recorder-appimage-${pkgver}.AppImage" "${pkgdir}/opt/mochi-recorder-appimage/mochi.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/mochi-recorder-appimage/mochi.AppImage" "${pkgdir}/usr/bin/mochi"
  install -Dm644 "${srcdir}/mochi-recorder.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mochi-recorder.png"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/mochi-recorder.desktop" << 'EOF'
  [Desktop Entry]
  Name=Mochi
  Comment=A modern Linux screen recorder with smooth animations like Screen Studio
  Exec=mochi
  Icon=mochi-recorder
  Terminal=false
  Type=Application
  Categories=AudioVideo;Recorder;Utility;
EOF
}

