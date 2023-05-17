# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="vigad-appimage"
pkgver=0.1.1
pkgrel=1
pkgdesc="Extract live-data from your screen."
arch=("x86_64")
url="https://vigad.wordpress.com/"
_githuburl="https://github.com/VisualGameData/VIGAD"
license=(MIT)
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}-bin")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Vigad-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/VisualGameData/VIGAD/main/LICENSE")
sha256sums=('064d044a5266e5215a52cb78b3e3ebb71db8cc3bf4528542294864b6cb0c0a5e'
            'a987d5add58c58a7d976130c1fa78f6ddace5f5cdb2c1bac8cc6dbdb8e54376d')
        
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/vigad.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
