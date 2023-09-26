# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=swc_mclauncher
pkgname="${_pkgname//_/-}-bin"
_appname="SWC Minecraft Launcher"
pkgver=1.1.11
pkgrel=2
pkgdesc="Quickly and easily launch Software City's Minecraft-Modpacks through this beautiful and custom Minecraft Launcher!"
arch=('x86_64')
url="https://projects.software-city.org/p/mc-launcher"
_githuburl="https://github.com/Davis-Software/swc_mclauncher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Davis-Software/swc_mclauncher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('7e2c8aa6fe7756e8d764eca5d5fde077b88a77ef641692c75b316e0d9910fdbc'
            '2fc239445e58117449b5049215f6540a4f37dd25e4ed79a7325b57e1406c1437'
            '51284b0b05188b66864b4e486cfebfa45a80f2b7e640c7968b0f7b1f01efbf20')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\" %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {   
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}//LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}