# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded-Avalonia
pkgver=1.2023.08.28
pkgrel=4
pkgdesc="ImageFan Reloaded is a light-weight image viewer, supporting multi-core processing."
arch=("aarch64" "x86_64")
url="https://github.com/mihnea-radulescu/imagefanreloaded"
license=("GPL3" "MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip' 'staticlibs')
depends=('gcc-libs' 'fontconfig' 'glibc' 'dotnet-runtime-6.0' 'ttf-dejavu' 'ttf-ms-fonts')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x64.zip")
sha256sums_aarch64=('becf0aea70f8245de2ee57da34a690ad375f4ca8fcdab461242a24f712ba7403')
sha256sums_x86_64=('8f228ca40838b341f0eb0a486599c74f9611015c64e7621037d0ce77694c3111')
prepare() {
    convert "${srcdir}/${_pkgname}-Linux-"*/ApplicationIcon.ico "${srcdir}/${pkgname%-bin}.png"
    gendesk -f -n --categories "Graphics" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    install -Dm755 "${srcdir}/${_pkgname}-Linux-"*/"${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-Linux-"*/lib* -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-Linux-"*/*.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}