# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=roloviewer-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Image slideshow viewer"
arch=('x86_64')
url='https://github.com/rosenloecher-it/roloviewer'
license=('GPL3')
provides=('roloviewer')
depends=('zlib')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/rosenloecher-it/roloviewer/releases/download/${pkgver}/roloviewer-${pkgver}-x86_64.AppImage")
sha256sums=('f4a0328e0cb9aa657d34f8d1b4589aba343535e84ef86974f815936b2938d862')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/roloviewer.png "${pkgdir}/usr/share/pixmaps/roloviewer.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "RoloViewer" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Graphics;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage"
  ln -s /opt/roloviewer/${pkgname%-bin}.AppImage "${pkgdir}/usr/bin/roloviewer"
}