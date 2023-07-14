# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kdesktop-bin
_appname=cn.kdocs.kdesktop
pkgver=3.7.7
pkgrel=2
pkgdesc="金山文档"
arch=('x86_64')
url="https://www.kdocs.cn"
_downurl="https://mirrors.sdu.edu.cn/spark-store-repository/store"
license=('custom')
provides=("Kingsoft")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/office/${_appname}/${_appname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('57e6e623bbb761d5b2e3a8dd5c179189e585b40e14cc9f9f17213797093e88ef'
            '4ee767e5d2075fd6bdaef54f77e8d2d92230ac7546f3deb906548bc723e073a8')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/files/lib/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|Exec=/opt/apps/${_appname}/files/bin/${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Utility|Office|g" \
        -i "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop"
    sed "s|/opt/apps/${_appname}/entries/icons/hicolor/256x256/apps/${pkgname%-bin}.png|${pkgname%-bin}|g;s| %U||g" \
        -i "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/"
    done
    install -Dm644 "${srcdir}/opt/apps/${_appname}/files/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}