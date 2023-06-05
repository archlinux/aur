# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yaradio-yamusic-appimage"
pkgver=1.0.6
pkgrel=1
pkgdesc="Yandex Radio + Yandex Music desktop application - Неофициальное десктопное приложение для Яндекс Радио + Яндекс Музыка"
arch=('x86_64')
url="https://github.com/dedpnd/yaradio-yamusic"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/YaMusic.app-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/dedpnd/yaradio-yamusic/master/LICENSE")
sha256sums=('5fc29c0eae957f47b92e929af0a10baea786e2db8f5153def5bc69977f53440d'
            'cea59fab6a546b299040932620ad01ba4f590cc427ebd9d6f3ae8c271a1055ac')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/icons/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}