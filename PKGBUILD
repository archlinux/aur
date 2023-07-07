# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.16.6
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker"
arch=('x86_64')
url="https://lvce-editor.github.io/lvce-editor"
_githuburl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
provides=("${pkgname%-bin}")
depends=('electron')
optdepends=('bash')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/lvce-editor/lvce-editor/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('71f9bb6d41fe6b8eb3eda761ce4ed3da91bdfb2844e8a034af4d6f7d62b47cbe'
            '0d800c2b83c70f46b9d9eb95aef534728eda8be35a7c25da09e544ef044c1ff3'
            '11265f898da216ce9ba630c5d33e9c3d9093fa0639b5de385820359d37540e1c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
}