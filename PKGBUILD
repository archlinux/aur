# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xbyyunpan-bin
_zhsname="小白羊云盘"
_pkgname="XBYDriver"
pkgver=3.12.3
pkgrel=1
pkgdesc="小白羊网盘 - Powered by 阿里云盘Open"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/gaozhangmin/aliyunpan"
license=('MIT')
provides=("aliyunpan-liupan1890")
conflicts=(
    "${pkgname%-bin}"
    "aliyunpan-liupan1890"
    "aliyunpan-odomu"
    "xbydriver"
)
depends=(
    'alsa-lib'
    'libxdamage'
    'pango'
    'libxrandr'
    'libxext'
    'libxcb'
    'libx11'
    'libxcomposite'
    'libxkbcommon'
    'nss'
    'libxfixes'
    'at-spi2-core'
    'libdrm'
    'cairo'
    'gtk3'
    'nspr'
    'wayland'
    'libcups'
    'expat'
    'mesa'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gaozhangmin/aliyunpan/v${pkgver}/LICENSE"
)
sha256sums=('37b92e7918a9a8599a558d5e978900966b243cc9f6c964c36f4afa35bf50e009')
sha256sums_aarch64=('14188cdbc55495f317ffbfd0f0d6442a6182ecabe797581e961cf1c32432e7ea')
sha256sums_armv7h=('440e49197550b27756d3773b4416cbc32741b8cd6fd2ee27ff6caec127d29275')
sha256sums_x86_64=('44b9d1462ff62b500243d86dceb01767c2d239b907baafda8bbe1abef13ebb63')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_zhsname}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_zhsname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}