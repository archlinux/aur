# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=moonmodeler
pkgver=2.6.1
pkgrel=1
pkgdesc="Data modeling tool for MongoDB, MariaDB & GraphQL (Trial)"
arch=('x86_64')
url='https://www.datensen.com/data-modeling/moon-modeler-for-databases.html'
license=("custom:${pkgname}")
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://www.datensen.com/downloads/Moon%20Modeler-${pkgver}.AppImage")
sha256sums=('3cc3123657624de20eeaa4956fe9c69d2059aa81722434f0dd25ac482346b903')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/moonmodeler.png "${pkgdir}/usr/share/pixmaps/moonmodeler.png"
  install -Dm644 squashfs-root/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Moon Modeler" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Development;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/${pkgname}"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}
