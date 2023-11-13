# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ecency-surfer-bin
_pkgname=Ecency
pkgver=3.0.35
pkgrel=4
pkgdesc="Immutable, decentralized, uncensored, rewarding communities built, owned and operated by its users"
arch=('x86_64')
url="https://ecency.com/"
_githuburl="https://github.com/ecency/ecency-vision"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ecency/ecency-vision/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('95d6ef6078caef72715ce3e248d2e0be8dfbef9d996c3016f1f99902f7159879'
            '4f2d94ac09ba20ec3861cf9fbb2b52ee17592b64b6fb812f04d7b71417da494d'
            '67e9b32704965dac9b0e17b2eccc7e69c01e5432a890b8b9fc8bb77b6fe4ba89')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}