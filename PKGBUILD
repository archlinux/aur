# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kahla-bin
_appname=Kahla
pkgver=4.5.0
pkgrel=6
pkgdesc="Kahla is a cross-platform business messaging app."
arch=("x86_64")
url="https://www.kahla.app/"
_githuburl="https://github.com/AiursoftWeb/Kahla.App"
license=('MIT')
depends=('bash' 'hicolor-icon-theme' 'electron8')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/AiursoftWeb/Kahla.App/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('937672471cd111e8136d819db3e59707d97356c02585b88fca84beab46c8209b'
            '2f5e2140f19b9216cb3fecd147f935586c806c54b2edcdf5521f535237a1c3f7'
            '2434fea803493a58455cc6175503e1dada9e2816e6b2f70a16f31dd1d265a74d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Utility|Network;Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}