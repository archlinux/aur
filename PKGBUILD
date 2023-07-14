# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="hathor-wallet-bin"
pkgver=0.26.0
pkgrel=2
pkgdesc="Hathor Official Wallet for Desktop"
arch=('x86_64')
url="https://hathor.network/"
_githuburl="https://github.com/HathorNetwork/hathor-wallet"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/HathorNetwork/hathor-wallet/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('99202186258f7eea3fd78cd89d25d972b47caa8069c7006bfb2b86da1043a828'
            '8fc34ede2d7615b4ef2eee1acfa4a457ab3e7c317e4ba6a1354b3b57ad11cbd0'
            'c7f45a655e3b27c92f38ed135440b4467efeea9b6cd4b8dd1bc9c31a3c00d792')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/Hathor Wallet/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/Hathor Wallet/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}