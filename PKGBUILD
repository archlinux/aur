# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="muffon-bin"
pkgver=1.6.0
pkgrel=2
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_githuburl="https://github.com/staniel359/muffon"
license=("MIT")
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron>=20' 'hicolor-icon-theme' 'java-runtime')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/staniel359/muffon/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('0f503193a62f82ffd84e2a8b11940d883ebc57ede5745cd1969a0223d5b510b6'
            '6d1a22f787896797e8e8d5e0afd14121b67041b13d59965344c1b499fab6e8f8'
            '2b8e49be115742dde628281e446b654116fee5dad5a892d37eab67a30e1ed646')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s| %U||g;s|Audio|AudioVideo|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}