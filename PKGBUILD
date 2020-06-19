# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ananas-desktop
pkgver=0.9.0
pkgrel=1
pkgdesc="A hackable data integration & analysis tool to enable non technical users to edit data processing jobs and visualise data on demand"
arch=('any')
url='https://ananasanalytics.com'
license=('Apache')
depends=('zlib')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ananas-analytics/ananas-desktop/releases/download/v${pkgver}/Ananas.Analytics.Desktop.Edition.${pkgver}.linux.AppImage")
sha256sums=('5b9dc4178a560d88b496c18f0cf2929d02579c941871162163da299b2b46a2b3')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/ananasanalytics.png "${pkgdir}/usr/share/pixmaps/ananas-desktop.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Ananas Desktop" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/share/${pkgname}/${pkgname}.AppImage"
  ln -s /usr/share/ananas-desktop/${pkgname}.AppImage "${pkgdir}/usr/bin/ananas-desktop"
}