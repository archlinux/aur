# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="excel-parser-processor-appimage"
pkgver=1.3.1
pkgrel=1
pkgdesc="Simply generates an array of items from the rows of an Excel file and does the repetitive tedious operations step by step recursively till every item of the array is processed."
arch=('x86_64')
url="https://github.com/btargac/excel-parser-processor"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Excel-Parser-Processor-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/btargac/excel-parser-processor/master/LICENSE")
sha256sums=('90b96fec41aae2dffdd5a7c72dfdd8ad954b2675662a4dc4360851410aa73b5d'
            'cb199ba111f4311de39df0fc7458a8573f9c62f42eb2332b4262f0e6b31a3ff7')
     
prepare() {
    chmod a+x "excel-parser-processor-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/excel-parser-processor.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/excel-parser-processor-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}