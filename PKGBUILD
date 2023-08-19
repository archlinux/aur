# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=code-notes-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="A simple code snippet & gist manager for developers built with Electron & Vue.js"
arch=('x86_64')
url="https://lauthieb.github.io/code-notes"
_githuburl="https://github.com/lauthieb/code-notes"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron8')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/lauthieb/code-notes/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('45262ac6118071ec68a750eff6dd5ab7578bbff870a03403a32fa46935b5c47c'
            'd292c9f2252858356efe3e4f88cdb6052756a2708ffe12ecb579b7731469ca76'
            '5c32a43d7bed600bc560ed5a05d3e31cbe37ae52e657758550e5f1fa7f2210b8')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}