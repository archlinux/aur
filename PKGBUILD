# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kinda-bard-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Google Bard Desktop Application"
arch=(x86_64)
url="https://www.zorbawong.com/"
_githuburl="https://github.com/zorbajwhk/KindaBard"
license=('AGPL3')
depends=('bash' 'electron24' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('01a88b842648036f9034e50ba5c626a33281ae23e4b279bf6aea67dc43aec75c'
            'bd9710294c8858d70feed3157c5208c6cb4314b6b3208d35be4df7b3b22ec296')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}//opt/Kinda Bard/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/Kinda Bard/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}