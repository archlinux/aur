# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wewechat++-bin"
_pkgver=1.2.5
pkgver="${_pkgver}_20230523"
pkgrel=3
pkgdesc="Make weweChat great again!!! 美丽的第三方微信PC客户端"
arch=('aarch64' 'x86_64')
url="https://gitee.com/spark-community-works-collections/wewechat-plus-plus"
license=('MIT')
providers=("${pkgname%++-bin}")
conflits=("${pkgname%-bin}" "${pkgname%++-bin}")
depends=('hicolor-icon-theme' 'bash' 'electron2')
optdepends=(
    'xdg-desktop-portal-kde: KDE 下的原生对话框'
	'xdg-desktop-portal-lxqt: lxqt 下的原生对话框'
	'xdg-desktop-portal-gnome: Gnome 下的原生对话框'
)
source_aarch64=("${pkgname%++-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver//_/-}/${pkgname%++-bin}-${_pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%++-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver//_/-}/${pkgname%++-bin}-${_pkgver}-linux-amd64.deb")
source=("LICENSE::https://gitee.com/spark-community-works-collections/wewechat-plus-plus/raw/${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('b64d5463454e756d3008ff1a0511179b777884a0b4ed50dfe33e9182cf0c54db'
            'e3b7961ad7afbe95d9074095c01dd476fa1594ae107de12dac1109b9c4201c8f')
sha256sums_aarch64=('5ac045251db9af48a7a2d898cfefd0198de23c69e4bd91b7162344bf574051f8')
sha256sums_x86_64=('48f0ede636da8f3a7b4d94a75a8324a51413dbf7ad040cf0acc173cd200088cb')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|Name=${pkgname%++-bin}|Name=${pkgname%-bin}|g;s|\"/opt/${pkgname%++-bin}/${pkgname%++-bin}\" %U|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%++-bin}.desktop"
}
package() {
    install -Dm644 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%++-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/opt/${pkgname%++-bin}/resources/electron.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%++-bin}.desktop" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%++-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}