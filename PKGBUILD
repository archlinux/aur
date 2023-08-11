# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-pdf-viewer-bin
_appname=Electron-PDF-Viewer
pkgver=1.0
pkgrel=2
pkgdesc="PDF viewer created using Electron framework and PDF.js"
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/praharshjain/Electron-PDF-Viewer"
license=('MIT')
depends=('bash' 'electron2')
makedepends=('asar')
conflicts=("${pkgname%-bin}")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Electron-PDF-Viewer_${pkgver}.0_armv7l.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/Electron-PDF-Viewer_${pkgver}.0_ia32.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Electron-PDF-Viewer_${pkgver}.0_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/praharshjain/Electron-PDF-Viewer/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('70fbb7828155cceb6b104bad95d085832731eec32b74683ff34740e2161e2e42'
            'f7c27e910a205573e8cb8370fcd2c0467d162e83764c2a8c72a163944ceb0ba5')
sha256sums_armv7h=('47ee8289ac564315538e97c8abf7e4907323f0a54120e3aa5dfdaa5af0adef59')
sha256sums_i686=('924b9497d979f39df36b594a2d553b5e9c7f233144943ec51c51831518f33a5f')
sha256sums_x86_64=('5531e0281ebf710ff5f04fb605eb314226c45ff5ecc8888387ab44423b1d9da5')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/usr/lib/${_appname}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/lib/${_appname}/resources/electron.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|Exec=${_appname} %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}