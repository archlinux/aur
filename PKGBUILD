# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xbyyunpan-bin
_oriname="小白羊云盘"
_pkgname="XBYDriver"
pkgver=3.12.1
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
    'dbus'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/gaozhangmin/aliyunpan/main/LICENSE")
sha256sums=('37b92e7918a9a8599a558d5e978900966b243cc9f6c964c36f4afa35bf50e009')
sha256sums_aarch64=('6f69f35b53ca1ae383e003990f8eac10b47ba804b0553adf7c1098e66ec331c6')
sha256sums_armv7h=('82528902bc8720d8f565fde20c6cb0b202331ff6e6c3248c38b5e715497488a9')
sha256sums_x86_64=('831bdc5358a700e6158fb7949326e1e34eb1581ab810eb09e51b641176de0bf5')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_oriname}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname%-bin},usr/bin}
    cp -r "${srcdir}/opt/${_oriname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}