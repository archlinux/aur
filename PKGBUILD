# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pygc-bin
_pkgname=PYGC
pkgver=0.1.529
pkgrel=1
pkgdesc="Combines the notebook/canvas features of Obsidian, Notion's AI capabilities, and Python AIGC.提供Obsidian笔记、白板的替代品。"
arch=("x86_64")
url="https://github.com/pygc/pygc"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
    'expat'
    'hicolor-icon-theme'
    'python>=3'
    'python-lsp-server'
    'python-tornado'
    'python-jsonrpcserver'
    'python-requests'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/release/${_pkgname}_${pkgver}-20231116_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/pygc/pygc/main/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('654c95a46470c86f5f42cc819e77c8decf4c4cf8b917935879550a4278dee33a'
            '5c575f22403eb693573be6f0e3b7e771ecab604cc9d7a9a4250bbef04f5fb77b'
            '4d5aa115aa1c8b6ab5ca14216b4407a654c14bc71fd73c29a20806bc59f64375')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}