# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netpad-bin
_pkgname=NetPad
pkgver=0.5.0
pkgrel=1
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23' 'gcc-libs' 'hicolor-icon-theme' 'glibc' 'zlib' 'dotnet-sdk')
optdepends=('')
source=("${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.pacman"
    "LICENSE::https://raw.githubusercontent.com/tareqimbasher/NetPad/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('2f7f09266111e57f199082430c581ece66cbbfba087cd47655269fff936f0d44'
            '43485534798b716310ae2a0edeebb00e97ff0e42e5fde13ff2994e2bc82348f6'
            '23524ad330b9f906c040c8016493ddadc55952b30f715151d56a56e0dbe68ede')
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