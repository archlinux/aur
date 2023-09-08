# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thief-bin
pkgver=4.0.0
pkgrel=2
pkgdesc="一款创新跨平台摸鱼神器,支持小说、股票、网页、视频、直播、PDF、游戏等摸鱼模式,为上班族打造的上班必备神器,使用此软件可以让上班倍感轻松,远离ICU"
arch=('x86_64')
url="https://thief.im/"
_githuburl="https://github.com/cteamx/Thief"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron8')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux64.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('500583196bd45cc23e611abaf113f9733edc3da0361b641171385ba7aaeed4fc'
            'f99e8b5a7ccb715f511c1a07eb037332688a77fcaaf731ca1c45796d554406a1')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}