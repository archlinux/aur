# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="translationcore-bin"
pkgver=3.4.0lite
_pkgver=3.4.0-LITE
pkgrel=2
pkgdesc="An open source platform for checking and managing Bible translation projects"
arch=('x86_64')
url="https://www.translationcore.com/"
_githuburl="https://github.com/unfoldingWord/translationCore"
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron17' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${_pkgver}/tC-linux-x64-${_pkgver}-5b601bd.deb"
        "LICENSE::https://raw.githubusercontent.com/unfoldingWord/translationCore/develop/LICENSE"
        "${pkgname%-bin}.sh")
sha256sums=('171ce1a32db7b30464a3d4b9296a4cefa6f789f8c6873b7964f9058da1231434'
            'a756bd73c46e3e9b85ff0222658f4c63851ebc5af63811adc4333ff618688417'
            '3aa6edb1f5a12939f6b8ac380d8762ac18b7186e14f0dfb9d61d57c13f2f317f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/opt/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|unfoldingword-${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16 22 32 48 64 128;do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}-${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}