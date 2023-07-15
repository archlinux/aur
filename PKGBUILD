# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="kindle-companion-bin"
pkgver=1.0.6
pkgrel=3
pkgdesc="Kindle Companion enables readers to easily access and manage vocabulary lookups and clippings on their Amazon Kindle device"
arch=("x86_64")
url="https://saharzelo.github.io/kindle-companion/"
_githuburl="https://github.com/saharzelo/kindle-companion"
license=('MIT')
depends=('electron20' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/Kindle-Companion-${pkgver}.deb"
    "LICENSE.md::https://raw.githubusercontent.com/saharzelo/kindle-companion/main/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('564bc5e3eb16f9af6fc7b9727e500e9a0f4fd4ce2d040de3d0faf636df5452a3'
            '613e2910e5cda3ce6e5b878e214d955c2a34e3475e97d365fcbec5e345a06038'
            '783e58076dd5a87a21b723f35c76569d77a78f1c08c08827cc4169707b155dba')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Kindle-Companion/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|/opt/Kindle-Companion/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm6444 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}