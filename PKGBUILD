# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=universal-data-tool-bin
pkgver=0.10.18
pkgrel=1
pkgdesc="Collaborate & label any type of data, images, text, or documents, in an easy web interface or desktop app"
arch=('x86_64')
url='https://universaldatatool.com'
license=('MIT')
provides=('universal-data-tool')
depends=('zlib')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/UniversalDataTool/universal-data-tool/releases/download/v${pkgver}/Universal-Data-Tool-${pkgver}.AppImage"
        'LICENSE::https://github.com/UniversalDataTool/universal-data-tool/raw/master/LICENSE')
sha256sums=('6f851e11536bb6d11867923598d3705b3f9af349e2b422d627f30747f9240e80'
            '7c65062117526f7cec40896a71b8dfab96da54194f61b18b95816920839da172')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/universal-data-tool.png "${pkgdir}/usr/share/pixmaps/universal-data-tool.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Universal Data Tool" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Development;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.AppImage"
  ln -s /usr/share/universal-data-tool/${pkgname%-bin}.AppImage "${pkgdir}/usr/bin/universal-data-tool"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}