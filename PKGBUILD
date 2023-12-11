# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fclash-bin
_appname="cn.kingtous.${pkgname%-bin}"
pkgver=1.4.3
pkgrel=3
pkgdesc="A better open-source clash client written by Flutter.更好的Clash客户端,支持自动设置代理,兼容RULE-SET、TUN特性"
arch=(
    'aarch64'
    'x86_64'
)
url="https://kingtous.cn/2022/05/09/%E8%87%AA%E5%88%B6fclash%E7%AE%80%E4%BB%8B/"
_ghurl="https://github.com/fclash/fclash"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gdk-pixbuf2'
    'libepoxy'
    'libdbusmenu-glib'
    'pango'
    'gtk3'
    'cairo'
    'libayatana-appindicator'
    'at-spi2-core'
    'harfbuzz'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-aarch64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-x86_64.deb")
sha256sums_aarch64=('1daaf336e4e89fa5919509118707097b3e1453c2372c29315b62014f2df04f3b')
sha256sums_x86_64=('c000f7708196b7adb7c389fb3fccb939aad397d6080e7c3d78c6bfea2dec7e87')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/apps/${_appname}/files/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|/opt/apps/${_appname}/entries/icons/${_appname}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/apps/${_appname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/icons/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}