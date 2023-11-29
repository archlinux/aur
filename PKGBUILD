# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xterminal-bin
_pkgname=XTerminal
pkgver=1.4.1
#update:https://txc.qq.com/products/598955/change-log
#_electronversion=23
pkgrel=1
pkgdesc="不仅是强大的SSH工具，更提供本地控制台，以及更多即将推出的开发相关功能，让您专注于创造卓越的代码"
arch=("x86_64")
url="https://www.terminal.icu/"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    #"electron${_electronversion}"
    'libcups'
    'alsa-lib'
    'libxdamage'
    'libxfixes'
    'at-spi2-core'
    'pango'
    'python'
    'nss'
    'libxkbcommon'
    'libx11'
    'libxrandr'
    'cairo'
    'gtk3'
    'java-runtime'
    'libxext'
    'libdrm'
    'libxcb'
    'libxcomposite'
    'mesa'
    'nspr'
    'expat'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://cdn-cn.xterminal.cn/xterminal/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE.html"
)
sha256sums=('13d8b2dbb5c50b704d97a174cc5fbbbb260d2a5ca0a035f1a6bd56cad8036e11'
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