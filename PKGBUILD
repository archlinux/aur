# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=testmace
pkgver=latest
pkgrel=1
pkgdesc="A modern powerful crossplatform tool for working with an API and creating automated API tests"
arch=('x86_64')
url='https://testmace.com'
license=("custom:${pkgname}")
depends=('zlib')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://download.testmace.com/TestMace.AppImage")
sha256sums=('SKIP')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/testmace.png "${pkgdir}/usr/share/pixmaps/testmace.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Test Mace" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Development;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  ln -s /opt/${pkgname}/${pkgname}.AppImage "${pkgdir}/usr/bin/testmace"
}