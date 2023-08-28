# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mootool-bin
_pkgname=MooTool
pkgver=1.5.1
pkgrel=1
pkgdesc="Handy tool set for developers. 开发者常备小工具"
arch=("x86_64")
url="https://github.com/rememberber/MooTool"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxrender' 'libx11' 'glibc' 'zlib' 'java-runtime' 'libxext' 'libxi' 'alsa-lib' 'libxtst' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/rememberber/MooTool/master/LICENSE.txt")
sha256sums=('d62511618e14cdd876728d51e49a4195e01f4d01bd64678eab86bebc29884e02'
            '91930d61ff6e2bd3ceaf0ac0de4431d4ede9a9a940ca327367820df54762e333')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|/opt/${_pkgname}/${_pkgname} %U|${pkgname%-bin} %U|g;s|/opt/${_pkgname}/${_pkgname}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt/${_pkgname}"/* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}