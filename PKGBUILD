pkgname=rkdeveloptool-gui-appimage
pkgver=5.2.0
pkgrel=1
pkgdesc="RKDevelopTool GUI is a graphical front-end for Rockchip's official rkdeveloptool"
arch=('x86_64')
url='https://github.com/gahingwoo/RKDevelopTool-GUI'
license=()
options=("!strip")
depends=('fuse2')
source=(
  "rkdeveloptool-gui-v${pkgver}-x86_64.AppImage::https://github.com/gahingwoo/RKDevelopTool-GUI/releases/download/${pkgver}/RKDevelopTool-GUI-${pkgver}-x86_64.AppImage"
)
sha512sums=('f69ff14c1f4e234da8dfbeac7ca41b505b27070567a8242983af66694dda3070988d258cc30b94551d9f35622504a8a2c6c41406fd4f69ece072fe11a87ead01')

_installdir=/opt/rkdeveloptool-gui

prepare() {
  chmod a+x ./rkdeveloptool-gui-v${pkgver}-x86_64.AppImage
  ./rkdeveloptool-gui-v${pkgver}-x86_64.AppImage --appimage-extract >/dev/null
  sed -i "s#Exec=rkdeveloptool-gui#Exec=${_installdir}/rkdeveloptool-gui.AppImage %U#" "squashfs-root/rkdeveloptool-gui.desktop"
  sed -i "s#Icon=rkdeveloptool-gui#Icon=/usr/share/icons/hicolor/256x256/apps/rkdeveloptool-gui.png#" "squashfs-root/rkdeveloptool-gui.desktop"
}

package() {
  install -Dm755 "rkdeveloptool-gui-v${pkgver}-x86_64.AppImage" "${pkgdir}/${_installdir}/rkdeveloptool-gui.AppImage"
  install -Dm644 "squashfs-root/rkdeveloptool-gui.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/rkdeveloptool-gui.png"
  install -Dm644 "squashfs-root/rkdeveloptool-gui.desktop" "${pkgdir}/usr/share/applications/rkdeveloptool-gui.desktop"
}
