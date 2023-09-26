# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=react-explorer-bin
_pkgname=React-Explorer
pkgver=3.1.0
pkgrel=2
pkgdesc="File manager written in TypeScript, React, Blueprint and packaged with Electron"
arch=("aarch64" "x86_64")
url="https://github.com/warpdesign/react-explorer"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21' 'hicolor-icon-theme')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/warpdesign/react-explorer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('2ee003eed53af196295f44ab14460333b6d129dc96dd1143e5f119f3122650cd'
            '4ffec0fcec0c327abd79d11ecd5ee45270409875656f199b30b48a47c4cb6548')
sha256sums_aarch64=('f6cc0961d53798ac4991bd566294dd7c0c13b9809bd7c61c6910e3345642b398')
sha256sums_x86_64=('b36054b9b5679894aaf57b1f521f4dbfb1c6ee32c32f06b285b105190014a175')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g;s|FileManager|System;Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}