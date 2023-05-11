# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="protoman-appimage"
pkgver=0.4.1
pkgrel=1
pkgdesc="A Postman-like API client for protobuf-based messages."
arch=("x86_64")
url="https://github.com/spluxx/Protoman"
license=("MIT")
depends=('zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}-bin")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Protoman-${pkgver}.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/spluxx/Protoman/master/LICENSE.txt")
sha256sums=('50934845993c2bcaaa3a659c907703fd9eef16dbf68f714aad512ff8b06445a3'
            'a70b7631e4233a150ba463a503958f7e76bbb44d3da40ef36b22e4cc158742d9')
        
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/protoman.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}