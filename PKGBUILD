# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ecency-surfer-bin
_appname=Ecency
pkgver=3.0.35
pkgrel=2
pkgdesc="Immutable, decentralized, uncensored, rewarding communities built, owned and operated by its users"
arch=('x86_64')
url="https://ecency.com/"
_githuburl="https://github.com/ecency/ecency-vision"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ecency/ecency-vision/development/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('95d6ef6078caef72715ce3e248d2e0be8dfbef9d996c3016f1f99902f7159879'
            '4f2d94ac09ba20ec3861cf9fbb2b52ee17592b64b6fb812f04d7b71417da494d'
            '3ec0d6e0c5bf7ea3cafeca2c680069262cf9bd709dfe1189c4b107c0c80d1744')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}