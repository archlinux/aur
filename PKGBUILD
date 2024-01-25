# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xterminal-bin
_pkgname=XTerminal
pkgver=1.8.0
#update:https://txc.qq.com/products/598955/change-log
#_electronversion=28
pkgrel=1
pkgdesc="不仅是强大的SSH工具，更提供本地控制台，以及更多即将推出的开发相关功能，让您专注于创造卓越的代码"
arch=("x86_64")
url="https://www.xterminal.cn/"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    #"electron${_electronversion}"
    'alsa-lib'
    'at-spi2-core'
    'python'
    'nss'
    'gtk3'
    'java-runtime'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://cdn-cn.xterminal.cn/xterminal/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE.html"
)
sha256sums=('b1394d9aabbfe5bd4c493525915fcf3a0ba75800468b3066614a3e343a262ab6'
            '8d08a959e0086a206ef3454cc0fc323454c73609cd764f102d8d2d076dafa0af')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}