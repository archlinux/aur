# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=moonmodeler
pkgver=2.3.0
pkgrel=1
pkgdesc="Data modeling tool for MongoDB, MariaDB & GraphQL (Trial)"
arch=('x86_64')
url='https://www.datensen.com/data-modeling/moon-modeler-for-databases.html'
license=("custom:${pkgname}")
depends=('zlib')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://www.datensen.com/downloads/Moon%20Modeler-${pkgver}.AppImage")
sha256sums=('7bc1b70ab8a3dceb8363f50c29e00d48f4bcb6624a3d5eb0b8e4635e1b7668c2')

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
          --categories 'Development;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  ln -s /opt/${pkgname}/${pkgname}.AppImage "${pkgdir}/usr/bin/moonmodeler"
}