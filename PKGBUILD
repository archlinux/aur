# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded-Avalonia
pkgver=1.2023.10.09
pkgrel=2
pkgdesc="ImageFan Reloaded is a light-weight image viewer, supporting multi-core processing."
arch=("aarch64" "x86_64")
url="https://github.com/mihnea-radulescu/imagefanreloaded"
license=("GPL3" "MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip' 'staticlibs')
depends=('gcc-libs' 'fontconfig' 'glibc' 'dotnet-runtime-6.0')
makedepends=('imagemagick')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x64.zip")
sha256sums_aarch64=('a4f994c9434b50e946c419fd12db5f6692e47f3f499d09053a0ed8aed1518698')
sha256sums_x86_64=('64567083ba0c467aec7015b2c9027d6464fac56dc600c0b221532b907660ff74')
build() {
    convert "${srcdir}/${_pkgname}-Linux-"*/ApplicationIcon.ico "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n --categories "Graphics" --name "${_pkgname}" --exec "env LC_CTYPE=en_US.UTF-8 ${pkgname%-bin}"
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