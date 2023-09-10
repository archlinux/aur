# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netsend-bin
_appname=NetSend
pkgver=2.0.5
pkgrel=6
pkgdesc="An intranet file transfer tool based on umijs + electron + javascript.一个基于 umijs + electron + javascript 构建的内网文件传输工具"
arch=('x86_64')
url="https://github.com/williamnie/netSend"
license=('GPL2')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash' 'electron21' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}.5/${_appname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('88f7f7cfc21efbe66ab34b1283763c10b37bde802d2d53a329eed62d49779f0b'
            '611c266f359f3ffd8bf3e67196651f03c5ca259357551e5969235adbbd06d0b3')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar p "${srcdir}/opt/${_appname}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}