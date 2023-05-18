# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bbg-appimage"
pkgver=20230505
pkgrel=1
pkgdesc="A static blog generator based on Electron Technology"
arch=('x86_64')
url="https://bbg.nekomoe.xyz/"
_githuburl="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}-${arch}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/bbg-contributors/bbg/master/LICENSE")
sha256sums=('4cc00ed7dac0257f9079d14fb60c52d2f2b0608a18500ea18f79cbb475dd9f60'
            '436a6d536138f203ac333858cff92a568be62797752b3adb94bcaa0f6ffe7ef6')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/bbg.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}