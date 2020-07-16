# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=localxpose-gui
pkgver=latest
pkgrel=1
pkgdesc="A reverse proxy that enables you to expose your localhost to the internet"
arch=('x86_64')
url='https://localxpose.io'
license=("custom:${pkgname}")
provides=('localxpose')
depends=('zlib')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://lxpdownloads.sgp1.digitaloceanspaces.com/gui/LocalXpose-linux-amd64.AppImage"
        'LICENSE')
sha256sums=('SKIP'
            'SKIP')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/localxpose.png "${pkgdir}/usr/share/pixmaps/localxpose-gui.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "LocalXpose" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Network;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  ln -s /opt/localxpose-gui/${pkgname}.AppImage "${pkgdir}/usr/bin/localxpose-gui"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}