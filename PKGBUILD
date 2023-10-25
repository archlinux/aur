# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netpad-bin
_pkgname=NetPad
pkgver=0.5.1
pkgrel=1
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23' 'gcc-libs' 'hicolor-icon-theme' 'glibc' 'zlib' 'dotnet-sdk')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
    "LICENSE::https://raw.githubusercontent.com/tareqimbasher/NetPad/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f6eb3060a9fc29c00040e84cf4db8d60a7b40c45e2590b3daec1aa90769932ce'
            '43485534798b716310ae2a0edeebb00e97ff0e42e5fde13ff2994e2bc82348f6'
            '41bd27cd80f1c5a18fa79813ff0fe812024e506b34c16fc6c1bc6dbd379a6036')
build() {
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_pkgname}/resources/bin" "${pkgdir}/opt/${pkgname%-bin}/resources"
    for _icons in 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}