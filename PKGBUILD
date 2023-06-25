# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="modv-appimage"
pkgver=3.29.1
pkgrel=1
pkgdesc="modular audio visualisation powered by JavaScript"
arch=("x86_64")
url="https://modv.vcync.gl/"
_githuburl="https://github.com/vcync/modV"
license=("MIT")
depends=('zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/modV-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/vcync/modv/next/LICENSE")
sha256sums=('987b13cbd076f0113a4a11df8cd132e1580dec7abe5ea69fa12a6e5e5a5f7992'
            '4ff9462e56a52889b0005f007e0a66930c6b19687751f551bf7316b6ee35119e')
        
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}