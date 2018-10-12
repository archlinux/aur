# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_pkgver=1.0.0-b40
pkgname=ossia-score-appimage
pkgver=1.0.0b40
pkgrel=1
pkgdesc="an interactive sequencer for the intermedia arts."
arch=('x86_64')
url="https://ossia.io/"
license=('custom')
depends=('glib2' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-svg' 'qt5-websockets')
source=("Score.AppImage::https://github.com/OSSIA/score/releases/download/v${_pkgver}/Score-v${_pkgver}-amd64.AppImage"
        "ossia-score")
md5sums=('c21b30e221d0e13f77f22c80584373af'
         'da517b82b443be8057ee4fbadb414e43')

package() {
  # Extract AppImage
  chmod +x Score.AppImage
  ./Score.AppImage --appimage-extract

  root="${srcdir}/squashfs-root"
  sed -i "/^Exec=/cExec=ossia-score" "${root}/Score.desktop"

  install -d "${pkgdir}/usr/lib/score"
  install -D "${root}/usr/lib/score/"* "${pkgdir}/usr/lib/score/"
  install -D "${root}/usr/lib/libscore"* "${pkgdir}/usr/lib/"
  install -D "${root}/usr/lib/libossia"* "${pkgdir}/usr/lib/"

  install -d "${pkgdir}/usr/bin"
  install -D "${root}/usr/bin/score" "${pkgdir}/usr/bin/"
  install -D "${srcdir}/ossia-score" "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/share"
  install -D "${root}/Score.desktop" "${pkgdir}/usr/share/applications/Score.desktop"
  install -D "${srcdir}/squashfs-root/usr/share/pixmaps/score.png" "${pkgdir}/usr/share/pixmaps/score.png"
}
