# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tjmc-launcher-bin
_appname=TJMC-Launcher
pkgver=0.1.20
pkgrel=1
pkgdesc="A simple to use, extremely fast, and well supported app, that allows you to install pure and modded versions of Java Minecraft."
arch=('aarch64' 'x86_64')
url="https://launcher.tjmc.ru/"
_githuburl="https://github.com/tjmcraft/TJMC-Launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron23')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-setup-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-setup-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/tjmcraft/TJMC-Launcher/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('1a25e3b0f4bf16543e5f802cf6d9d189bcae27617ca8be936ad866a8955d9ce6'
            'aaa56cbf9dd0dd94894e5ec2b6058f4b83416ca90ec467e3f2ef460f84c786b7')
sha256sums_aarch64=('6c625f2a144e8f9efae53fde383f112d3917ecf7886a57f9b31eaaadd7eafcc3')
sha256sums_x86_64=('abe7876f5d30e91068526401595b86f878ab072fa0cad9ee905d5f59386380f9')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}