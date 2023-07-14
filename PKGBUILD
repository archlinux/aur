# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="kahla-bin"
pkgver=4.5.0
pkgrel=4
pkgdesc="Kahla is a cross-platform business messaging app."
arch=("x86_64")
url="https://www.kahla.app/"
_githuburl="https://github.com/AiursoftWeb/Kahla.App"
license=('MIT')
depends=('bash' 'hicolor-icon-theme' 'electron>=8')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/AiursoftWeb/Kahla.App/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('937672471cd111e8136d819db3e59707d97356c02585b88fca84beab46c8209b'
            '2f5e2140f19b9216cb3fecd147f935586c806c54b2edcdf5521f535237a1c3f7'
            '17abb880026eb06bff66d8cf7b1f3fe6bb387da93d49236f356180dd9e1188f8')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/Kahla/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/Kahla/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Utility|Network;Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}