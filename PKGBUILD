# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=weektodo-bin
_pkgname=WeekToDo
pkgver=2.1.0
pkgrel=3
pkgdesc="WeekToDo is a Free and Open Source Weekly Planner. Stop prioritizing what's on your schedule and start scheduling your priorities."
arch=("x86_64")
url="https://weektodo.me/"
_githuburl="https://github.com/manuelernestog/weektodo"
license=(GPL3)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('12f77013d6de60e71d041cc79f7d226881fafc88876bbf2de16f672b02d96895'
            'f5e1d8281005c12514340d3a7aedd8142e521ac1a77fc9a5079553338939ca6f')
prepare() {
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}