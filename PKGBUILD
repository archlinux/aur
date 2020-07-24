# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tagstoo
pkgver=2.0.1
pkgrel=1
pkgdesc="Software to tag folders and files, with multimedia and epubs preview"
arch=('x86_64')
url='https://tagstoo.sourceforge.io'
license=('GPL')
makedepends=('gendesk')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://sourceforge.net/projects/tagstoo/files/Tagstoo%20${pkgver}%20linux64/Tagstoo.AppImage/download")
sha256sums=('9d60633add0dba52ad2e8ba349b3882f4e3f834f10f584dd6d16ff19b634f4e0')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/tagstoo.png "${pkgdir}/usr/share/pixmaps/tagstoo.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Tagstoo" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/tagstoo"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}