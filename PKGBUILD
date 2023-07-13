# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="flawless-cut-bin"
pkgver=1.0.0
pkgrel=2
pkgdesc="Fast and lossless video cutter and merger based on Electron."
arch=('x86_64')
url="https://github.com/metadream/app-flawless-cut"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron23' 'hicolor-icon-theme' 'bash' 'libmediainfo')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/metadream/app-flawless-cut/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('a1c96b8a2f6b06ffaac913ddb387cfe1b7795d6cb3546b0e48f7560811b9cc37'
            'f3eac6adfa3dd9332b033a4aa8f565d05947b371fa729ceb6712a0123c5dcc46'
            'a0508010e0c7e86046fff1f3b96de31d2dd5d2367a1b25106226d007ce8127d6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 257x257;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}